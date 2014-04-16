<!doctype html>
<html>
<head>
<title>Team management</title>
<meta name="layout" content="app" />
<style>
.invitationform {
	display:none;
}
</style>
</head>
<body>
	<div class="page-header">
		<h2>
			Management page for:
			${user.team?.name}
		</h2>
	</div>
	<h3>Members</h3>
	<div class="row">
	<div class="col-md-8">
	<g:render template="memberstableadmin" bean="${user.team}" var="team" />
	</div>
	</div>
	<h3>Pending invitations</h3>
	<g:if test="${user.team.pendingInvitations.size() > 0}">
	<div class="row">
	<div class="col-md-6">
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
	</div>
	</div>
	</g:if>
	<g:if test="${user.team.pendingInvitations.size() == 0}">
		<p>No invitations awaiting response.</p>
	</g:if>
	<div class="invitebutton">
	<button onclick="$('.invitationform').show();$(this).hide();" class="btn btn-primary">Invite a user</button>
	</div>
	<div class="invitationform">
	<g:form controller="invitation" action="save" name="invitation-create-form" method="post"
		class="form-inline">
		<fieldset>
			<div class="form-group">
					<g:select name="userid" from="${users}" class="form-control" style="min-width: 250px; max-width: 500px;"
						value="${fieldValue(bean: invitation, field: 'invitee.id')}"
						optionKey="id" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Send invitation</button>
			</div>
		</fieldset>
	</g:form>
	</div>
</body>
</html>