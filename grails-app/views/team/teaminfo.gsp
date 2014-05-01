<!doctype html>
<html>
<head>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>
			Details for team:
			${team.name }
		</h2>
	</div>
	<div class="row">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Stats</h3>
				</div>
				<div class="panel-body">
					<g:render template="stats" bean="${team}" />
				</div>
			</div>
		</div>
		<div class="col-md-7">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Members</h3>
				</div>
				<div class="panel-body">
					<g:render template="memberstable" bean="${team.users}" />
				</div>
			</div>
		</div>
	</div>
	<g:if test="${team.name == 'Java Life'}">
		<div class="row">
			<div class="col-md-5">
				<div class="vid">
					<iframe width="560" height="315"
						src="//www.youtube.com/embed/b-Cr0EWwaTk" frameborder="0"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</g:if>
</body>
</html>