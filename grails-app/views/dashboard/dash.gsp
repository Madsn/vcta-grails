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
		<div class="col-md-6" style="display:block;">
			<h3 style="display: inline-block;">
				Trips
			</h3>
			<div id="addtripbtn" class="pull-right" style="vertical-align: center;">
				<button onclick="$('#addtripform').show();$('#addtripbtn').hide();" class="btn btn-primary">Add a new trip</button>
			</div>
			<div id="addtripform" style="display: none;">
		<g:form controller="trip" action="save" name="trip-add-form" method="post"
		class="form-horizontal">
		<fieldset>

			<div class="form-group">
				<label class="col-md-6 control-label" for="dayofmonth"> Day
					of month (must be in may) </label>
				<div class="col-md-4">
						<g:select name="dayofmonth" from="${1..31}"
							value="${new Date().date}" class="form-control"
							noSelection="['':'-Choose day of month-']" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-6 control-label" for="textinput">Distance
					(km)</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="distanceKm"
						name="distanceKm"
						value="${fieldValue(bean: trip, field: 'distanceKm')}" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-6 col-md-4">
						<input type="button" onclick="$('#addtripbtn').show();$('#addtripform').hide();" class="btn btn-danger" value="Cancel" />
						<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>

		</fieldset>
	</g:form>
			</div>
		
			<!--  -->
			<g:render template="/trip/triptable-editable" bean="${user}" />
			
			
		</div>
		<div class="col-md-4 col-md-offset-1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">My stats</h3>
				</div>
				<div class="panel-body">
					<g:render template="/member/stats" bean="${user}" />
				</div>
			</div>
		</div>
	</div>
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
</body>
</html>