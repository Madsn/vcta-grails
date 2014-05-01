<tr>
	<td>
		${i+1}
	</td>
	<td>
		<g:link controller="team" action="show" id="${team.id}">
			${team.name}
		</g:link>
	</td>
	<td>
		<g:link controller="member" action="show" id="${team.leader.id}">
			${team.leader.username}
		</g:link>
	</td>
	<td>
		${team.users.size()}
	</td>
	<td>
		<g:formatNumber number="${team.getTotalKm()}" format="0.00"/>
	</td>
	<td>
		<g:formatNumber number="${team.getAverageKm() }" format="0.00"/>
	</td>
	<td>
		<g:formatNumber number="${team.getAverageCyclingDays() }" format="0.00"/>
	</td>
</tr>