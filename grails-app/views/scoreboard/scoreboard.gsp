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
					<th>Rank</th>
					<th>Team name</th>
					<th># of Members</th>
					<th>Total km</th>
					<th>Km/members</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="team"
					in="${teams.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}" status="i">
					<g:render template="teams" model="[team: team, i: i]" />
				</g:each>
			</tbody>
		</table>
		<h2>People</h2>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Rank</th>
					<th>Username</th>
					<th>Team</th>
					<th>Total km</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="user"
					in="${users.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}" status="i">
					<g:render template="users" model="[user: user, i: i]"/>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>