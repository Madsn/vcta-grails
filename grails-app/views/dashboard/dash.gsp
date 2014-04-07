<!doctype html>
<html>
<head>
<title>Dashboard</title>
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
		<h2>
			Trips
			<g:link controller="trip" action="create">Add</g:link>
		</h2>
		<g:if test="${user.trips.size() > 0}">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Distance</th>
						<th>Start time</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each var="trip"
						in="${user.trips.sort{a,b -> a.startTime > b.startTime ? -1 : 1}}">
						<g:render template="trips" bean="${trip}" var="trip" />
					</g:each>
				</tbody>
			</table>
		</g:if>
		<br />
		<h2>Team:</h2>
		<g:if test="${user.team == null }">
			<g:render template="noteam" collection="${user }" />
		</g:if>
		<g:if test="${user.team != null }">
			<g:render template="team" collection="${user }" />
			<h3>Invitations sent:</h3>
			<g:if test="${user.id == user.team.leader.id }">
				<g:link controller="invitation" action="create"
					params="${[userid: 1, teamid: user.team.id]}">Invite user</g:link>
				<g:if test="${user.team.pendingInvitations.size() > 0}">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>User</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<g:each var="invitation" in="${user.team.pendingInvitations }">
								<g:render template="pending_invitations" bean="${invitation}"
									var="invitation" />
							</g:each>
						</tbody>
					</table>
				</g:if>
				<g:if test="${user.team.pendingInvitations.size() == 0}">
					<p>No invitations awaiting response.</p>
				</g:if>
			</g:if>
		</g:if>
		<br />
		<h3>Invitations received:</h3>
		<g:if test="${user.invitations.size() == 0 }">
			<p>You currently have no team invitations</p>
		</g:if>
		<g:if test="${user.invitations.size() > 0 }">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Team name</th>
						<th>Leader</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each var="invitation" in="${user.invitations}">
						<g:render template="invitations" bean="${invitation}"
							var="invitation" />
					</g:each>
				</tbody>
			</table>
		</g:if>
		<br />
		<h2>My stats:</h2>
		<g:render template="stats" collection="${user}" />
	</div>
</body>
</html>