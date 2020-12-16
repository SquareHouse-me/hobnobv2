@extends('voyager::master')

@section('content')
    <style>
        .c-dashboardInfo {
            margin-bottom: 15px;
        }

        .c-dashboardInfo .wrap {
            background: #ffffff;
            box-shadow: 2px 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 7px;
            text-align: center;
            position: relative;
            overflow: hidden;
            padding: 40px 25px 20px;
            height: 100%;
        }

        .c-dashboardInfo__title,
        .c-dashboardInfo__subInfo {
            color: #6c6c6c;
            font-size: 1.18em;
        }

        .c-dashboardInfo span {
            display: block;
        }

        .c-dashboardInfo__count {
            font-weight: 600;
            font-size: 2.5em;
            line-height: 64px;
            color: #323c43;
        }

        .c-dashboardInfo .wrap:after {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 10px;
            content: "";
        }

        .c-dashboardInfo:nth-child(1) .wrap:after {
            background: linear-gradient(82.59deg, #00c48c 0%, #00a173 100%);
        }

        .MuiSvgIcon-root-19 {
            fill: currentColor;
            width: 1em;
            height: 1em;
            display: inline-block;
            font-size: 24px;
            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            user-select: none;
            flex-shrink: 0;
        }

        a.button {
            display: block;
            position: relative;
            padding: 0;
            margin: 10px 20px 10px 0;
            font-weight: 600;
            text-align: center;
            line-height: 50px;
            color: #FFF;
            border-radius: 5px;
            transition: all 0.2s ;
        }

        .btnLightBlue {
            background: #5DC8CD;
        }

        .businessOwners {
            background: none;
            box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.5);
        }

        .businessOwners:before {
            content: 'Show Business Owners';
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 50px;
            border-radius: 5px;
            transition: all 0.2s ;
        }

        .btnLightBlue.businessOwners:before {
            background: #5DC8CD;
        }

        .businessOwners:before {
            box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.4);
        }


        .businessOwners:hover:before {
            margin-top: -2px;
            margin-left: 0px;
            transform: scale(1.1,1.1);
            -ms-transform: scale(1.1,1.1);
            -webkit-transform: scale(1.1,1.1);
            box-shadow: 0px 5px 5px -2px rgba(0, 0, 0, 0.25);
        }



    </style>
    <div class="page-content">
        @include('voyager::alerts')
        @if(auth()->user()->role_id == 1)
            @include('voyager::dimmers')
        @elseif(auth()->user()->role_id == 2)
            <?php
            $businessOwners = \Illuminate\Support\Facades\DB::table('users')
                ->where('role_id', '=', 3)->get();
            $businessOwners = count($businessOwners);
            ?>
            <div id="root">
                    <div class="container pt-5">
                        <div class="row align-items-stretch">
                            <div class="c-dashboardInfo col-lg-4 col-md-6">
                                <div class="wrap">
                                    <h4 class="heading heading5 hind-font medium-font-weight c-dashboardInfo__title">
                                        Business Owners
                                        <svg
                                            class="MuiSvgIcon-root-19" focusable="false" viewBox="0 0 24 24"
                                            aria-hidden="true" role="presentation">
                                            <path fill="none" d="M0 0h24v24H0z"></path>
                                            <path
                                                d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z">
                                            </path>
                                        </svg>
                                    </h4>
                                    <span class="hind-font caption-12 c-dashboardInfo__count">{{ $businessOwners }}</span>
                                    <a href="{{ route('voyager.business.owner') }}" class="button businessOwners btnLightBlue">Show Business Owners</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        @else
        @endif
    </div>
@stop
