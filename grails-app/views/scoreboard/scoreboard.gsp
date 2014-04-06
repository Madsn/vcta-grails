<!doctype html>
<html>
<head>
<title>Scoreboard</title>
<meta name="layout" content="app" />
</head>
<body>
	<p style="color: red;">
		${error}
	</p>
	<p style="color: blue;">
		${msg}
	</p>
	<h2>Teams</h2>
	<g:each var="team"
		in="${teams.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}">
		<g:render template="teams" bean="${team}" var="team" />
	</g:each>
	<h2>People</h2>
	<g:each var="user"
		in="${users.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}">
		<g:render template="users" bean="${user}" var="user" />
	</g:each>
</body>
</html>