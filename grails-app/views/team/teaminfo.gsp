<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
	<h2>Details for team: ${team.name }</h2>
	</div>
	<h3>Members</h3>
		<g:render template="memberstable" bean="${team.users}" />
</body>
</html>