<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<div class="container">
		<g:form action="save" name="trip-create-form" method="post"
			class="form-horizontal">
			<fieldset>
			
			<legend>Register/edit trip</legend>

			<div class="form-group">
				<label class="col-md-4 control-label" for="dayofmonth"> Day
					of month (must be in may) </label>
				<div class="col-md-4">
					<g:if test="${trip != null}">
					<g:select name="dayofmonth" from="${1..31}"
						value="${fieldValue(bean: trip, field: 'date.date')}" class="form-control"
						noSelection="['':'-Choose day of month-']" />
					</g:if>
					<g:if test="${trip == null}">
					<g:select name="dayofmonth" from="${1..31}"
						value="${new Date().date}" class="form-control"
						noSelection="['':'-Choose day of month-']" />
					</g:if>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Distance (km)</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="distanceKm" name="distanceKm"
						value="${fieldValue(bean: trip, field: 'distanceKm')}" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-6 col-md-2">
					<g:link controller="dashboard"><input type="button" class="btn btn-danger" value="Cancel"/></g:link>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>

			</fieldset>
		</g:form>
	</div>
</body>
</html>