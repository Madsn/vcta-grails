<!doctype html>
<html>
<head>
<title><g:message
		code="nimble.view.account.registeraccount.initiate.title" /></title>
<r:require modules="login-css" />
<r:require modules="bootstrap3" />
<r:layoutResources />
<meta name="layout" content="app" />
<style>
.login-content {
margin-left: 10px;
}
</style>
</head>
<body>
	<g:render template="/layouts/menu" />
	<div class="login-container">
		<div class="login-content">
			<h2 class="border-bottom">
				<g:message
					code="nimble.view.account.registeraccount.initiate.heading" />
			</h2>
			<n:flashembed />
			<n:errors bean="${user}" />
			<g:form action="saveuser" name="signup-form" method="post"
				class="form-horizontal" role="form">
				<div class="login-input">
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							id="username" class="form-control" name="username"
							value="${fieldValue(bean: user, field: 'username')}"
							placeholder="Mikmak" />
					</div>
					<div class="form-group">
						<label for="pass">Password</label> <input type="password"
							size="30" class="form-control" id="pass" name="pass"
							value="${user.pass?.encodeAsHTML()}" placeholder="******" />
					</div>
					<div class="form-group">
						<div class="controls">
							<label for="passConfirm">Confirm password</label> <input
								type="password" size="30" id="passConfirm" name="passConfirm"
								class="form-control" value="${user.passConfirm?.encodeAsHTML()}"
								placeholder="******" />
						</div>
					</div>
					<div class="form-group">
						<label for="fullName">Full name</label> <input type="text"
							size="30" id="fullName" name="fullName" class="form-control"
							value="${user.profile?.fullName?.encodeAsHTML()}"
							placeholder="Mikkel Madsen"]>
					</div>
					<div class="form-group">
						<label for="email">Email (@systematic.com addresses only)</label>
							<input type="text" size="30" id="email" name="email"
								class="form-control"
								value="${user.profile?.email?.encodeAsHTML()}"
								placeholder="mikma@systematic.com" /> 
					</div>
				</div>
				<div class="login-actions">
					<span class="pull-right clearfix">
						<button type="submit" class="btn btn-primary">
							<g:message code="nimble.link.registeraccount" />
						</button>
					</span>
				</div>
			</g:form>
		</div>
	</div>
	<r:layoutResources />
</body>
</html>