<!doctype html>
<html>
<head>
<title>Scoreboard</title>
<meta name="layout" content="app" />
</head>
<body>
	<div class="container">
		<p style="color: red;">
			${error}
		</p>
		<p style="color: blue;">
			${msg}
		</p>
		<ul class="nav nav-tabs">
  			<li id="teamlink" class="active"><a id="teamtab" href="javascript:changeTab(1)">Teams</a></li>
  			<li id="peoplelink"><a id="peopletab" href="javascript:changeTab(0);">Individuals</a></li>
		</ul>
		<br/>
		<div id="teams">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Rank</th>
					<th>Team name</th>
					<th>Captain</th>
					<th># of Members</th>
					<th>Total km</th>
					<th>Km/members</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="team"
					in="${teams.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}" status="i">
					<g:render template="teams" model="[team: team, i: i]" />
				</g:each>
			</tbody>
		</table>
		</div>
		<div id="people" style="display: none;">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Rank</th>
					<th>Username</th>
					<th>Team</th>
					<th>Total km</th>
					<th>Cycling days</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="user"
					in="${users.sort{a,b -> a.getTotalKm() > b.getTotalKm() ? -1 : 1}}" status="i">
					<g:render template="users" model="[user: user, i: i]"/>
				</g:each>
			</tbody>
		</table>
		</div>
	</div>
<script type="text/javascript">
var changeTab = function(tab){
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
