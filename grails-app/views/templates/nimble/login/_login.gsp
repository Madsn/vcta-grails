<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>Login</title>
<meta name="layout" content="app" />
<g:javascript library="jquery" plugin="jquery" />
<r:require modules="bootstrap3" />
<r:require modules="login-css" />
<r:require module="legacy-support"/>
<r:layoutResources />
</head>
<body>
	<g:render template="/layouts/menu" />
	<div class="login-container" style="margin-top: 80px;">
		<div class="login-content">
			<h2 class="border-bottom">Sign In</h2>


			<div class="login-options">
				<h4>Don't have an account yet ?</h4>
				Create a new account
				<g:link controller="account" action="createuser">
                Sign up
            </g:link>
			</div>
			<div style="text-align: center; margin-bottom: 3px;">-- OR --</div>

			<g:form controller="auth" action="signin" method="post" name="login-form"
				id="login-form" role="form">
				<div class="login-input">
					<div class="form-group">
						<input type="hidden" name="targetUri" value="/main/index">
						<input type="text" name="username" id="username"
							placeholder="user@example.com">
					</div>
					<div class="form-group">
						<input type="password" name="password" id="password"
							placeholder="password">
					</div>
				</div>
				<div class="login-actions">
					<div class="checkbox">
						<label class="" style="display: inline-block;"> <input
							type="checkbox" name="rememberme"> Stay logged in?
						</label>
						<button type="submit" class="pull-right btn btn-primary">Sign in</button>
					</div>
				</div>
				<div class="login-options border-top">
					<h4>Forgotten password ?</h4>
					Click here to <g:link uri="forgottenpassword" style="text-transform: lowercase;"> Reset password </g:link>
				</div>
			</g:form>
		</div>
	</div>
<r:layoutResources/>
</body>
</html>