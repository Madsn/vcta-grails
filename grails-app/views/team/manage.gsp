<!doctype html>
<html>
<head>
<title>Team management</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>
			Management page for:
			${user.team?.name}
		</h2>
	</div>
	<h3>Members</h3>
	<g:render template="memberstableadmin" bean="${user.team}" var="team" />
	<h3>Invite a user</h3>
	<g:form controller="invitation" action="save" name="invitation-create-form" method="post"
		class="form-inline">
		<fieldset>
		
			<div class="form-group">
					<g:select name="userid" from="${users}" class="form-control" style="width: 250px;"
						value="${fieldValue(bean: invitation, field: 'invitee.id')}"
						optionKey="id" optionValue="username" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Send invitation</button>
			</div>
		</fieldset>
	</g:form>
	<h3>Pending invitations</h3>
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
</body>
</html>