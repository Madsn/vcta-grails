<g:set var="size" value="${team.users.size()}" />
<g:set var="totalkm" value="${team.getTotalKm()}" />
<table class="table table-hover">
<thead>
</thead>
<tbody>
	<tr>
		<td>Team captain</td>
		<td>
			<g:link controller="member" action="show" id="${team.leader?.id}">${team.leader?.username}</g:link>
		</td>
	</tr>
	<tr>
		<td>Team size</td>
		<td>
			${size} <%= size > 1 ? "members" : "member" %>
		</td>
	</tr>
	<tr>
		<td>Total km</td>
		<td>
			<g:formatNumber number="${totalkm}" format="0.00"/> km
		</td>
	</tr>
	<tr>
		<td>Average km per member</td>
		<td><g:formatNumber number="${totalkm/size}" format="0.00"/></td>
	</tr>
	<tr>
		<td>Total cycling days</td>
		<td>${team.getCyclingDays()}</td>
	</tr>
</tbody>
</table>