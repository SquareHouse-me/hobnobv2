<?php

namespace TCG\Voyager\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Facades\Voyager;
use Image;

class VoyagerUserController extends VoyagerBaseController
{
    public function profile(Request $request)
    {
        $route = '';
        $dataType = Voyager::model('DataType')->where('model_name', Auth::guard(app('VoyagerGuard'))->getProvider()->getModel())->first();
        if (!$dataType && app('VoyagerGuard') == 'web') {
            $route = route('voyager.users.edit', Auth::user()->getKey());
        } elseif ($dataType) {
            $route = route('voyager.' . $dataType->slug . '.edit', Auth::user()->getKey());
        }

        return Voyager::view('voyager::profile', compact('route'));
    }

    // POST BR(E)AD
    public function update(Request $request, $id)
    {
        if (Auth::user()->getKey() == $id) {
            $request->merge([
                'role_id' => Auth::user()->role_id,
                'user_belongstomany_role_relationship' => Auth::user()->roles->pluck('id')->toArray(),
            ]);
        }

        return parent::update($request, $id);
    }

    public function businessOwner(Request $request)
    {
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = 'users';


        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object)['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchable = SchemaManager::describeTable(app($dataType->model_name)->getTable())->pluck('name')->toArray();
            $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->get();
            foreach ($searchable as $key => $value) {
                $field = $dataRow->where('field', $value)->first();
                $displayName = ucwords(str_replace('_', ' ', $value));
                if ($field !== null) {
                    $displayName = $field->getTranslatedAttribute('display_name');
                }
                $searchNames[$value] = $displayName;
            }
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query = $model::select('*');
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%' . $search->value . '%';
                $query->where($search->key, $search_filter, $search_value);
            }

            if ($orderBy && in_array($orderBy, $dataType->fields())) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                $dataTypeContent = call_user_func([
                    $query->where('role_id', 3)->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->where('role_id', 3)->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->where('role_id', 3)->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        return Voyager::view('vendor.voyager.business-owner.index', compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn'
        ));
    }

    public function createBusinessOwner(Request $request)
    {
        $slug = 'users';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? new $dataType->model_name()
            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

        return Voyager::view('vendor.voyager.business-owner.edit-add', compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'phone' => 'required|numeric|unique:users,phone',
            'password' => 'required|string|min:6',
        ]);

        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

        event(new BreadDataAdded($dataType, $data));

        if (!$request->has('_tagging')) {
            if (auth()->user()->can('browse', $data)) {
                $redirect = redirect()->route("voyager.{$dataType->slug}.index");
            } else {
                $redirect = redirect()->back();
            }

            return $redirect->with([
                'message' => __('voyager::generic.successfully_added_new') . " {$dataType->getTranslatedAttribute('display_name_singular')}",
                'alert-type' => 'success',
            ]);
        } else {
            return response()->json(['success' => true, 'data' => $data]);
        }
    }

    public function storeBusinessOwner(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'phone' => 'required|numeric|unique:users,phone',
            'password' => 'required|string|min:6',
        ]);

        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

        event(new BreadDataAdded($dataType, $data));

        if (!$request->has('_tagging')) {
            if (auth()->user()->can('browse', $data)) {
                $redirect = redirect()->route("voyager.business.owner");
            } else {
                $redirect = redirect()->back();
            }

            return $redirect->with([
                'message' => "Business owner has been added successfully",
                'alert-type' => 'success',
            ]);
        } else {
            return response()->json(['success' => true, 'data' => $data]);
        }
    }

    public function editBusinessOwner(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);


        return Voyager::view('vendor.voyager.business-owner.edit-add', compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    public function updateBusinessOwner(Request $request, $id)
    {
        if (Auth::user()->getKey() == $id) {
            $request->merge([
                'role_id' => Auth::user()->role_id,
                'user_belongstomany_role_relationship' => Auth::user()->roles->pluck('id')->toArray(),
            ]);
        }

        $rules = [
            'name' => 'required',
            'first_name' => 'required',
            'last_name' => 'required',
            'phone' => 'required|numeric|unique:users,phone,' . $id,
            'email' => 'required|unique:users,email,' . $id,
        ];
        if (strlen($request['password']) > 0) {
            $rules['password'] = ['required', 'string', 'min:6', 'max:50'];
        }

        Validator::make($request->all(), $rules)->validate();

        return $this->updateBusinessOwnerRecord($request, $id);
    }

    public function updateBusinessOwnerRecord(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Compatibility with Model binding.
        $id = $id instanceof \Illuminate\Database\Eloquent\Model ? $id->{$id->getKeyName()} : $id;

        $model = app($dataType->model_name);
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
            $model = $model->{$dataType->scope}();
        }
        if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
            $data = $model->withTrashed()->findOrFail($id);
        } else {
            $data = $model->findOrFail($id);
        }

        // Check permission
        $this->authorize('edit', $data);

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->editRows, $dataType->name, $id)->validate();
        $this->insertUpdateData($request, $slug, $dataType->editRows, $data);

        event(new BreadDataUpdated($dataType, $data));

        if (auth()->user()->can('browse', app($dataType->model_name))) {
            $redirect = redirect()->route("voyager.business.owner");
        } else {
            $redirect = redirect()->back();
        }

        return $redirect->with([
            'message' => 'Business owner has been updated successfully',
            'alert-type' => 'success',
        ]);
    }

    public function assignChatRoom($id)
    {
        return view('vendor.voyager.chat-rooms.assign-chat-room', compact('id'));
    }

    public function storeAssignChatRoom(Request $request)
    {
        $request->validate([
            'chat_room' => 'required'
        ]);
        DB::table('assign_chat_room')->insert([
            'user_id' => $request->user_id,
            'chat_room_id' => $request->chat_room_id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        $redirect = redirect()->route("voyager.business.owner");
        return $redirect->with([
            'message' => 'Chat room assigned to business owner successfully',
            'alert-type' => 'success',
        ]);
    }

    public function chatRoom(Request $request)
    {
// GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = 'chat-rooms';


        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object)['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchable = SchemaManager::describeTable(app($dataType->model_name)->getTable())->pluck('name')->toArray();
            $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->get();
            foreach ($searchable as $key => $value) {
                $field = $dataRow->where('field', $value)->first();
                $displayName = ucwords(str_replace('_', ' ', $value));
                if ($field !== null) {
                    $displayName = $field->getTranslatedAttribute('display_name');
                }
                $searchNames[$value] = $displayName;
            }
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query = $model::select('*');
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%' . $search->value . '%';
                $query->where($search->key, $search_filter, $search_value);
            }

            if (Auth::user()->role_id == 3) {
                $chat_room_id = DB::table('assign_chat_room')->where('user_id', Auth::user()->id)->first();
                if (!empty($chat_room_id)) {
                    $chat_room_id = $chat_room_id->chat_room_id;
                }
                if ($orderBy && in_array($orderBy, $dataType->fields())) {
                    $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                    $dataTypeContent = call_user_func([
                        $query->where('id', $chat_room_id)->orderBy($orderBy, $querySortOrder),
                        $getter,
                    ]);
                } elseif ($model->timestamps) {
                    $dataTypeContent = call_user_func([$query->where('id', $chat_room_id)->latest($model::CREATED_AT), $getter]);
                } else {
                    $dataTypeContent = call_user_func([$query->where('id', $chat_room_id)->orderBy($model->getKeyName(), 'DESC'), $getter]);
                }
            } else {
                if ($orderBy && in_array($orderBy, $dataType->fields())) {
                    $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                    $dataTypeContent = call_user_func([
                        $query->orderBy($orderBy, $querySortOrder),
                        $getter,
                    ]);
                } elseif ($model->timestamps) {
                    $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
                } else {
                    $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
                }
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        return Voyager::view('vendor.voyager.chat-rooms.index', compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn'
        ));
    }

    public function chatOffer($id)
    {
        $chatOffer = DB::table('chat_room_offers')->select('chat_room_offers.id', 'chat_room_offers.image', 'chat_room_offers.created_at', 'users.name', 'chat_room_offers.status')
            ->join('users', 'users.id', '=', 'chat_room_offers.user_id')
            ->where('chat_room_id', $id)->get();
        return view('vendor.voyager.chat-room-offers.index', compact('id', 'chatOffer'));
    }

    
    public function addChatOffer($id)
    {
        return view('vendor.voyager.chat-room-offers.add', compact('id'));
    }

    public function storeChatOffer(Request $request)
    {
        $request->validate([
            'image' => 'required'
        ]);
        $image = $request->file('image');
        $filename = time() . '.' . $image->getClientOriginalExtension();
        \Image::make($image)->resize(300, 300)->save(storage_path('app/public/chat-offers/' . $filename));
        DB::table('chat_room_offers')->insert([
            'image' => $filename,
            'status' => 'Not Approved',
            'chat_room_id' => $request->chat_room_id,
            'user_id' => auth()->user()->id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        return redirect('/admin/chat-offers/' . $request->chat_room_id);
    }

    public function editChatOffer($id)
    {
        $chatOffer = DB::table('chat_room_offers')->where('id', $id)->first();
        return view('vendor.voyager.chat-room-offers.approval', compact('chatOffer'));
    }

    public function updateChatOffer(Request $request)
    {
        DB::table('chat_room_offers')->where('id', $request->id)->update([
            'status' => $request->status
        ]);
        return redirect('/admin/chat-offers/' . $request->chat_room_id);
    }

    public function readChatOffer($id)
    {
        $chatOffer = DB::table('chat_room_offers')->where('id', $id)->first();
        return view('vendor.voyager.chat-room-offers.read', compact('chatOffer'));
    }

    public function editApprovalChatRoom($id)
    {
        $chatRoom = DB::table('chat_rooms')->where('id', $id)->first();
        return view('vendor.voyager.chat-rooms.edit-approval', compact('chatRoom'));
    }

    public function updateApprovalChatRoom(Request $request)
    {
        $image = $request->file('image');
        if ($image) {
            $filename = time() . '.' . $image->getClientOriginalExtension();
            \Image::make($image)->save(storage_path('app/public/chat-rooms/' . $filename));
        } else {
            $filename = '';
        }
        DB::table('chat_room_update')->insert([
            'chat_room_id' => $request->id,
            'status' => 'Not Approved',
            'information' => $request->information,
            'logo' => $filename
        ]);
        return redirect('/admin/chat-rooms')->with([
            'message' => 'Your request to change chat info has been sent to admin for approval.',
            'alert-type' => 'success',
        ]);
    }

    public function approvalChatRoom($id)
    {
        $chatUpdateRoom = DB::table('chat_room_update')->where('chat_room_id', $id)
            ->where('status', 'Not Approved')->first();
        return view('vendor.voyager.chat-rooms.approval', compact('chatUpdateRoom'));
    }

    public function approvalRequestChatRoom(Request $request)
    {
        DB::table('chat_rooms')->where('id', $request->chat_room_id)->update([
           'logo' => $request->logo,
           'information' => $request->information
        ]);
        DB::table('chat_room_update')->where('chat_room_id', $request->chat_room_id)
            ->where('status', 'Not Approved')->update([
            'status' => 'Approved',
        ]);
        return redirect('/admin/chat-rooms')->with([
            'message' => 'Approval has been made of requested business owner.',
            'alert-type' => 'success',
        ]);
    }
}
