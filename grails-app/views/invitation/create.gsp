<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<g:form action="save" name="invitation-create-form" method="post">
		<div class="form-input">
			<div class="control-group">
				<div class="controls ">
					<g:select name="userid" from="${users}"
						value="${username}" optionKey="id" optionValue="username" />
				</div>
			</div>
			<div class="form-actions">
				<span class="pull-right clearfix">
					<button type="submit" class="btn btn-primary">Submit</button>
				</span>
			</div>
	</g:form>
</body>
</html>