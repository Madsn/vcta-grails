<!doctype html>
<html>
<head>
<title>Team management</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="container">
		<g:render template="team" />
		<h3>Invitations sent:</h3>
		<g:link controller="invitation" action="create"
			params="${[teamid: user.team.id]}">Invite user</g:link>
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
						<tr>
							<g:render template="pending_invitations" bean="${invitation}"
								var="invitation" />
						</tr>
					</g:each>
				</tbody>
			</table>
		</g:if>
		<g:if test="${user.team.pendingInvitations.size() == 0}">
			<p>No invitations awaiting response.</p>
		</g:if>
	</div>
</body>
</html>