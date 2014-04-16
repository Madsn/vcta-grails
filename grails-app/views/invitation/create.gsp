<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<g:form action="save" name="trip-create-form" method="post"
		class="form-horizontal">
		<fieldset>

			<legend>Invite user to join team</legend>

			<div class="form-group">
				<label class="col-md-4 control-label" for="dayofmonth">User</label>
				<div class="col-md-4">
					<g:select name="userid" from="${users}" class="form-control"
						value="${fieldValue(bean: invitation, field: 'invitee.id')}"
						optionKey="id" optionValue="username" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-6 col-md-2">
					<g:link controller="team" action="manage">
						<input type="button" class="btn btn-danger" value="Cancel" />
					</g:link>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</body>
</html>