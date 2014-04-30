<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>Login</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="layout" content="app" />
<g:javascript library="jquery" plugin="jquery" />
<r:require modules="bootstrap3" />
<r:require modules="login-css" />
<r:require module="legacy-support" />
<r:require module="vcta" />
<r:layoutResources />
<style>
:-ms-input-placeholder {
	color: rgb(186, 186, 186);
}

::-webkit-input-placeholder {
	color: rgb(186, 186, 186);
}

.placeholder {
	color: rgb(186, 186, 186);
}
</style>
</head>
<body>
	<g:render template="/layouts/menu" />
	<div class="login-container">
		<div class="login-content">
			<h2 class="border-bottom">Sign In</h2>


			<div class="login-options">
				<h4>Don't have an account yet ?</h4>
				Create a new account - 
				<g:link controller="account" action="createuser">
                Sign up
            </g:link>
			</div>
			<div style="text-align: center; margin-bottom: 3px;">-- OR --</div>

			<g:form controller="auth" action="signin" method="post"
				name="login-form" id="login-form" role="form">
				<div class="login-input">
					<div class="form-group">
						<label class="sr-only" for="username">Username</label> <input
							type="text" name="username" id="username" class="form-control"
							placeholder="username">
					</div>
					<div class="form-group">
						<label class="sr-only" for="password">Password</label> <input
							type="password" name="password" id="password" class="form-control"
							placeholder="password">
					</div>
				</div>
				<div class="login-actions">
					<div class="checkbox">
						<label class="" style="display: inline-block;"> <input
							type="checkbox" name="rememberme"> Stay logged in?
						</label>
						<button type="submit" class="pull-right btn btn-primary">Sign
							in</button>
					</div>
				</div>
				<div class="login-options border-top">
					<h4>Forgotten password ?</h4>
					Click here to
					<g:link uri="forgottenpassword" style="text-transform: lowercase;"> Reset password </g:link>
				</div>
			</g:form>
		</div>
	</div>
	<r:layoutResources />
	<script>
		$('input, textarea').placeholder();
	</script>
</body>
</html>