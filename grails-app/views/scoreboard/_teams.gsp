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
		${team.users.size()}
	</td>
	<td>
		${team.getTotalKm()}
	</td>
	<td>
		${team.getTotalKm()/team.users.size() }
	</td>
	<td>
		${team.getCyclingDays() }
	</td>
</tr>