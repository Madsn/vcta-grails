<!doctype html>
<html>
<head>
<title>Dashboard</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>Dashboard</h2>
	</div>
	<h3>
		Trips
		<g:link controller="trip" action="create">Add</g:link>
	</h3>
	<g:render template="/trip/triptable-editable" bean="${user}" />
	<br />
	<h3>Team:</h3>
	<g:if test="${user.team == null }">
		<g:render template="noteam" collection="${user }" />
	</g:if>
	<g:if test="${user.team != null }">
		<g:render template="team" collection="${user }" />
		<g:if
			test="${grailsApplication.config.vcta.manageAllowed && user.id == user.team.leader.id}">
			<g:link controller="team" action="manage">Manage team</g:link>
		</g:if>
	</g:if>
	<br />
	<h4>Invitations received:</h4>
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
					<tr>
						<g:render template="invitations" bean="${invitation}"
							var="invitation" />
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
	<br />
	<h3>My stats:</h3>
	<g:render template="/member/status" collection="${user}" />
</body>
</html>