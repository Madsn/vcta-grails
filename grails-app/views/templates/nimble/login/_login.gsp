<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>
        Login
    </title>
    <meta name="layout" content="app" />
    <r:require modules="nimble-login"/>
    <r:layoutResources/>
</head>
<body>
<g:render template="/layouts/menu" />
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
            <g:link controller = "account" action = "createuser">
                Signup
            </g:link>
        </div>
        <div style="text-align: center; margin-bottom: 3px;">-- OR --</div>

        <form action="/auth/signin" method="post" name="login-form" id="login-form" >
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