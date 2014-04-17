<!doctype html>
<html>
<head>
<title>Settings</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>Settings management</h2>
	</div>
	<g:form action="update">
	<label class="control-label">Allow team management</label>
		<g:checkBox name="manageallowed" value="${settings.manageAllowed}" class="form-control" />
	<button type="submit" class="btn btn-primary">Submit changes</button>
	</g:form>
</body>