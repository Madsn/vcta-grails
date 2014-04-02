<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<title><g:layoutTitle default="Systematic cykler til arbejde" /></title>
	<r:require module="bootstrap" />
	<r:require module="bootstrap-js" />
	<g:layoutHead />
	<r:layoutResources />
</head>
<body onload="${pageProperty(name:'body.onload')}">

	<g:render template="/layouts/menu" />

	<div id="bd" class="clear">
		<div id="content">
			<g:layoutBody />
			<r:layoutResources />
		</div>
</body>
</html>
