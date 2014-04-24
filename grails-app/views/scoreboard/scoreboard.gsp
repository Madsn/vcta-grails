<!doctype html>
<html>
<head>
<title>Scoreboard</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="page-header">
		<h2>Scoreboard</h2>
	</div>
	<ul class="nav nav-tabs">
		<li id="teamlink" class="active"><a id="teamtab"
			href="javascript:changeTab(1)">Teams</a></li>
		<li id="peoplelink"><a id="peopletab"
			href="javascript:changeTab(0);">Individuals</a></li>
	</ul>
	<br />
	<g:if test="${page == 'users'}">
		<g:javascript>changeTab(0);</g:javascript>
	</g:if>
	<g:if test="${page == 'teams'}">
		<g:javascript>changeTab(1);</g:javascript>
	</g:if>
	<g:if test="${span != null}">
		<g:javascript>
			$(function() {
				 $(".sorted")[0].children[0].innerHTML += " <span class='${span}'></span>"
				});
		</g:javascript>
	</g:if>
	<div class="row">
		<div class="col-md-12">
			<div id="teams">
				<table class="table table-striped table-hover" id="teamtable">
					<thead>
						<tr>
							<th></th>
							<g:sortableColumn property="name" title="Team name"
								action="teams" />
							<g:sortableColumn property="leader" title="Captain"
								action="teams" />
							<g:sortableColumn property="userCount" title="# of Members"
								defaultOrder="desc" action="teams" />
							<g:sortableColumn property="team-totalKm" title="Total km"
								defaultOrder="desc" action="teams" />
							<g:sortableColumn property="averageKm" title="Km/members"
								defaultOrder="desc" action="teams" />
							<g:sortableColumn property="team-cyclingDays" title="Cycling days"
								defaultOrder="desc" action="teams" />
						</tr>
					</thead>
					<tbody>
						<g:each var="team" in="${teams}" status="i">
							<g:render template="teams" model="[team: team, i: i]" />
						</g:each>
					</tbody>
				</table>
			</div>
			<div id="people" style="display: none;">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th></th>
							<g:sortableColumn property="username" params="[page: 'users']"
								title="Username" action="users" />
							<g:sortableColumn property="team" params="[page: 'users']"
								title="Team" action="users" />
							<g:sortableColumn property="totalKm" params="[page: 'users']"
								defaultOrder="desc" title="Total km" action="users" />
							<g:sortableColumn property="cyclingDays" params="[page: 'users']"
								defaultOrder="desc" title="Cycling days" action="users" />
						</tr>
					</thead>
					<tbody>
						<g:each var="user" in="${users}" status="i">
							<g:render template="users" model="[user: user, i: i]" />
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var changeTab = function(tab) {
			if (tab == 0) {
				$('#teams').hide();
				$('#people').show();
				$('#peoplelink').addClass('active');
				$('#teamlink').removeClass('active');
			} else if (tab == 1) {
				$('#people').hide();
				$('#teams').show();
				$('#peoplelink').removeClass('active');
				$('#teamlink').addClass('active');
			}
		};
	</script>
</body>
</html>
