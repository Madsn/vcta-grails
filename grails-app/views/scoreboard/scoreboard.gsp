<!doctype html>
<html>
<head>
<title>Scoreboard</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="container">
		<p style="color: red;">
			${error}
		</p>
		<p style="color: blue;">
			${msg}
		</p>
		<h2>Teams</h2>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Team name</th>
					<th># of Members</th>
					<th>Total km</th>
					<th>Km/members</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="team"
					in="${teams.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}">
					<g:render template="teams" bean="${team}" var="team" />
				</g:each>
			</tbody>
		</table>
		<h2>People</h2>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Username</th>
					<th>Team</th>
					<th>Total km</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="user"
					in="${users.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}">
					<g:render template="users" bean="${user}" var="user" />
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>