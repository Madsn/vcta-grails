<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<g:if test="${trip == null}">
		<g:set var="action" value="save" />
		<g:set var="submittext" value="Submit" />
	</g:if>
	<g:else>
		<g:set var="action" value="update" />
		<g:set var="submittext" value="Update" />
	</g:else>
	<g:form action="${action}" name="trip-edit-form" method="post"
		class="form-horizontal">
		<fieldset>

			<legend>Register/edit trip</legend>

			<div class="form-group">
				<label class="col-md-4 control-label" for="dayofmonth"> Day
					of month (must be in may) </label>
				<div class="col-md-4">
					<g:if test="${trip != null}">
						<g:select name="dayofmonth" from="${1..31}"
							value="${fieldValue(bean: trip, field: 'date.date')}"
							class="form-control" noSelection="['':'-Choose day of month-']" />
					</g:if>
					<g:if test="${trip == null}">
						<g:select name="dayofmonth" from="${1..31}"
							value="${new Date().date}" class="form-control"
							noSelection="['':'-Choose day of month-']" />
					</g:if>
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

			<g:if test="${action == 'update'}">
				<input type="hidden" name="id" value="${trip.id}" />
			</g:if>

			<div class="form-group">
				<div class="col-md-offset-6 col-md-2">
					<g:link controller="dashboard">
						<input type="button" class="btn btn-danger" value="Cancel" />
					</g:link>
					<button type="submit" class="btn btn-primary">${submittext}</button>
				</div>
			</div>

		</fieldset>
	</g:form>
</body>
</html>