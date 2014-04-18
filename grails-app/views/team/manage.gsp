<!doctype html>
<html>
<head>
<title>Team management</title>
<meta name="layout" content="app" />
<style>
.invitationform {
	display: none;
}
</style>
</head>
<body>
	<div class="page-header">
		<h2>
			Management page for team:
			${user.team?.name}
		</h2>
	</div>
	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Team stats</h3>
				</div>
				<div class="panel-body">
					<g:render template="stats" bean="${user.team}" var="team" />
				</div>
			</div>
		</div>
		<div class="col-md-7">
			<g:if test="${SettingsController.manageAllowed()}">
				<div class="panel panel-danger">
					<div class="panel-heading">
					<h3 class="panel-title">Disband</h3>
					</div>
					<div class="panel-body">
						<p>Remove all team members and delete the team. Can not be undone.</p>
						<g:render template="/team/confirmbox" />
						<div style="text-align: center;">
						<g:form controller="team" action="delete" id="${user.team?.id}">
    						<button class="btn btn-danger" type="button" data-toggle="modal"
    						 data-target="#confirmDelete" data-title="Disband team" 
    						 data-message="Are you sure you wish to disband this team, removing all members from it? If you just want to leave the team, you can do this after transferring leadership to another member.">
        					<i class="glyphicon glyphicon-trash"></i> Disband
    						</button>
						</g:form>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Pending invitations</h3>
					</div>
					<div class="panel-body">
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
						<div class="invitebutton">
							<div style="text-align: center;">
								<button onclick="$('.invitationform').show();$(this).hide();"
									class="btn btn-primary"><i class="glyphicon glyphicon-user"></i> Invite a user</button>
							</div>
						</div>
						<div class="invitationform">
							<g:form controller="invitation" action="save"
								name="invitation-create-form" method="post" class="form-inline">
								<fieldset>
									<div class="form-group">
										<g:select name="userid" from="${users}" class="form-control"
											style="min-width: 250px; max-width: 500px;"
											value="${fieldValue(bean: invitation, field: 'invitee.id')}"
											optionKey="id" />
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-envelope"></i> Send
											invitation</button>
									</div>
								</fieldset>
							</g:form>
						</div>
					</div>
				</div>
			</g:if>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Members</h3>
				</div>
				<div class="panel-body">
					<g:render template="memberstableadmin" bean="${user.team}"
						var="team" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>