<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>
        Login
    </title>

    <link href="/vcta-grails2/static/bundle-bundle_bootstrap_head.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <script src="/vcta-grails2/static/plugins/jquery-1.9.0/js/jquery/jquery-1.9.0.min.js" type="text/javascript" ></script>
    <link href="/vcta-grails2/static/plugins/nimble-0.7/css/nimble-login.css" type="text/css" rel="stylesheet" media="screen, projection" />

</head>
<body>
<div id="hd">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="brand" href="#">Systematic cykler til arbejde</a>
            </div>
        </div>
    </div>
</div>
<div class="login-container">
    <div class="login-content">
        <h2 class="border-bottom">
            Sign In
        </h2>


        <div class="login-options">
            <h4>
                Don't have an account yet ?
            </h4>
            Create a new account
            <a href="/vcta-grails2/register">
                Signup
            </a>
        </div>
        <div style="text-align: center; margin-bottom: 3px;">-- OR --</div>

        <form action="/vcta-grails2/auth/signin" method="post" name="login-form" id="login-form" >
            <div class="login-input">
                <div class="control-group">
                    <div class="controls ">
                        <input type="hidden" name="targetUri" value="/main/index"/>
                        <input type="text" name="username" id="username" placeholder="user@example.com">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="password" name="password" id="password" placeholder="password">
                    </div>
                </div>
            </div>
            <div class="login-actions">
                <label class="checkbox" style="display: inline-block;">
                    <input type="checkbox" name="rememberme">
                    Stay logged in?
                </label>
                <span class="pull-right clearfix">
                    <button type="submit" class="btn btn-primary">
                        Sign in
                    </button>
                </span>
            </div>
            <div class="login-options border-top">
                <h4>
                    Forgotten password ?
                </h4>
                Click here to
                <a href="/vcta-grails2/forgottenpassword" style="text-transform:lowercase;">
                    Reset password
                </a>
            </div>
        </form>
    </div>
</div>

</body>
</html>