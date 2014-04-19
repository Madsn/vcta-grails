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
	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">My stats</h3>
				</div>
				<div class="panel-body">
					<g:render template="/member/stats" bean="${user}" />
				</div>
			</div>
		</div>
		<div class="col-md-7">
			<g:if test="${ SettingsController.manageAllowed() }">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Team management</h3>
					</div>
					<div class="panel-body">
						<g:if test="${user.team?.leader == user}">
							<p>As team captain, you are able to perform a few management
								tasks, e.g.:</p>
							<ul>
								<li>Invite users to join your team</li>
								<li>Remove users from the team</li>
								<li>Transfer team leadership to another user</li>
							</ul>
							<p>
								<b>Team management will be disabled</b> shortly after the
								official start of the competition (may 1st). Be sure to complete
								all team management tasks prior to that date.
							</p>
							<button class="btn btn-primary pull-right" onClick="window.location = '/team/manage/${user.team?.id}' ">
								Open team management page
							</button>
						</g:if>
						<g:else>
							<p>Team management is available until the competition
								officially starts, allowing users to form teams. The captain of
								a team can invite other users to join their team.</p>
							<g:if test="${user.team != null}">
								<g:render template="/team/confirmbox" />
								<div class="pull-right">
									<g:form controller="team" action="removefromteam"
										params="[userid: user.id, teamid: user.team.id]">
										<button class="btn btn-danger" type="button"
											data-toggle="modal" data-target="#confirmDelete"
											data-title="Leave team"
											data-message="Are you sure you wish to leave this team?"
    						 				data-confirm="Leave team">
											Leave current team</button>
									</g:form>
								</div>
							</g:if>
							<g:else>
								<div id="createteambtn" class="pull-right">
									<button
										onclick="$('#createteamform').show();$('#createteambtn').hide();"
										class="btn btn-primary">Create a team</button>
								</div>
								<div id="createteamform" style="display: none;">
									<g:render template="/team/createform" />
								</div>
							</g:else>
						</g:else>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Team invitations</h3>
					</div>
					<div class="panel-body">
						<g:if test="${user.invitations.size() == 0 }">
							<p>You currently have no team invitations</p>
						</g:if>
						<g:if test="${user.invitations.size() > 0 }">
							<g:if test="${user.team != null}">
								<div class="alert alert-danger">Accepting an invitation to
									another team will cause you to leave your current team.</div>
							</g:if>
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
					</div>
				</div>
			</g:if>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Trips</h3>
				</div>
				<div class="panel-body">
					<div id="addtripbtn" class="pull-right">
						<button
							onclick="$('#addtripform').show();$('#addtripbtn').hide();"
							class="btn btn-primary">
							<i class="glyphicon glyphicon-plus"></i> Add a new trip
						</button>
					</div>
					<div id="addtripform" style="display: none;">
						<g:set var="maxday"
							value="${new DashboardController().maxTripDay()}" />
						<g:form controller="trip" action="save" name="trip-add-form"
							method="post" class="form-horizontal">
							<fieldset>

								<div class="form-group">
									<label class="col-md-4 control-label" for="dayofmonth">
										Day of month (must be in may) </label>
									<div class="col-md-4">
										<g:select name="dayofmonth" from="${1..maxday}"
											value="${new Date().date}" class="form-control"
											noSelection="['':'-Choose day of month-']" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Distance
										(km)</label>
									<div class="col-md-4">
										<input type="text" class="form-control" id="distanceKm"
											name="distanceKm"
											value="${fieldValue(bean: trip, field: 'distanceKm')}" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-md-offset-4 col-md-4">
										<input type="button"
											onclick="$('#addtripbtn').show();$('#addtripform').hide();"
											class="btn btn-danger" value="Cancel" />
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>

							</fieldset>
						</g:form>
					</div>
					<g:render template="/trip/triptable-editable" bean="${user}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>