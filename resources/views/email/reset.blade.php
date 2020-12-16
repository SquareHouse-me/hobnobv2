<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Safra</title>
    <style>
        body {
            background: #384047;
            font-family: sans-serif;
            font-size: 10px
        }

        form {
            background: #fff;
            padding: 4em 4em 2em;
            max-width: 400px;
            margin: 100px auto 0;
            box-shadow: 0 0 1em #222;
            border-radius: 5px;
        }

        p {
            margin: 0 0 3em 0;
            position: relative;
        }

        label {
            display: block;
            font-size: 1.6em;
            margin: 0 0 .5em;
            color: #333;
        }

        input {
            display: block;
            box-sizing: border-box;
            width: 100%;
            outline: none
        }

        input[type="text"],
        input[type="password"] {
            background: #f5f5f5;
            border: 1px solid #e5e5e5;
            font-size: 1.6em;
            padding: .8em .5em;
            border-radius: 5px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            background: #fff
        }

        span {
            border-radius: 5px;
            display: block;
            font-size: 1.3em;
            text-align: center;
            position: absolute;
            background: #2F558E;
            left: 105%;
            top: 25px;
            width: 160px;
            padding: 7px 10px;
            color: #fff;
        }

        span:after {
            right: 100%;
            top: 50%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-color: rgba(136, 183, 213, 0);
            border-right-color: #2F558E;
            border-width: 8px;
            margin-top: -8px;
        }

        input[type="submit"] {
            background: #2F558E;
            box-shadow: 0 3px 0 0 #1D3C6A;
            border-radius: 5px;
            border: none;
            color: #fff;
            cursor: pointer;
            display: block;
            font-size: 2em;
            line-height: 1.6em;
            margin: 2em 0 0;
            outline: none;
            padding: .8em 0;
            text-shadow: 0 1px #68B25B;

        }
    </style>
</head>
<body>
<form action="{{ url('/api/reset_password') }}" method="post">
    @if(session('error'))
        <p style="color: red; font-weight: bold">{{ session('error') }}</p>
    @endif
    @if(session('success'))
        <p style="color: green; font-weight: bold">{{ session('success') }}</p>
    @endif
    <input name="token" value="{{ $token }}" type="hidden">
    <input name="email" value="{{ $email }}" type="hidden">
    <p>
        <label for="password">Password</label>
        <input id="password" name="password" autocomplete="new-password" type="password">

    </p>
    <p>
        <label for="confirm_password">Confirm Password</label>
        <input id="confirm_password" name="password_confirmation" autocomplete="new-password" type="password">
    </p>
    <p>
        <input id="submit" type="submit" value="SUBMIT">
    </p>
</form>
</body>
</html>

