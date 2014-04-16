<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>Details for user: ${user.username }</h2>
	</div>
	<h3>Trips</h3>
		<g:render template="/trip/triptable" bean="${user}" />
	<h3>Status</h3>
		<g:render template="status" bean="${user }" />
</body>
</html>