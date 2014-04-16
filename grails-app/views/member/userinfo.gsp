<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>
			Details for user:
			${user.username }
		</h2>
	</div>
	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Stats</h3>
				</div>
				<div class="panel-body">
					<g:render template="stats" bean="${user}" />
				</div>
			</div>
			<div class="col-md-7">
				<h3>Trips</h3>
				<g:render template="/trip/triptable" bean="${user}" />
			</div>
		</div>
	</div>
</body>
</html>