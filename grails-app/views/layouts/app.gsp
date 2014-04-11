<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<title><g:layoutTitle default="Systematic cykler til arbejde" /></title>
<g:javascript library="jquery" plugin="jquery"/>
	<r:require module="bootstrap3" />
	<g:layoutHead />
	<r:layoutResources />
</head>
<body onload="${pageProperty(name:'body.onload')}">

	<g:render template="/layouts/menu" />

	<div id="bd" class="clear">
		<div id="content" style="margin-top: 80px;">
			<g:layoutBody />
			<r:layoutResources />
		</div>
</body>
</html>
