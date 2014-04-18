<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title><g:layoutTitle default="Systematic cykler til arbejde" /></title>
<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> 
<g:javascript library="jquery" plugin="jquery" />
<!--[if lt IE 9]>
<g:javascript library="legacy-support"/>
<![endif]-->
<r:require module="bootstrap3" />
<g:layoutHead />
<r:layoutResources />
<style type="text/css">
.alertcontainer {
	position: relative;
	width: 50%;
	height: 10px;
	margin: 20px auto;
}
.flash {
	position: absolute;
	width: 350px;
	top: 50px;
	left: 50%;
	margin-left: -175px;
	text-align: center;
}
</style>
</head>
<body onload="${pageProperty(name:'body.onload')}">
	<div class="alertcontainer">
		<g:if test="${error?.length() > 0}">
			<div class="alert alert-danger flash">
				${error }
			</div>
		</g:if>
		<g:if test="${msg?.length() > 0}">
			<div class="alert alert-info flash">
				${msg }
			</div>
		</g:if>
	</div>
	<div class="container">
		<g:render template="/layouts/menu" />
		<div id="bd" class="clear" />

		<div id="content" style="margin-top: 20px;">
			<g:layoutBody />
			<r:layoutResources />
		</div>

	</div>
	<script type="text/javascript">
	$('.flash').delay(1500).fadeOut(1000);
	</script>
</body>
</html>
