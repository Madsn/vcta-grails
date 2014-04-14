<tr>
	<td>
		<g:link controller="member" action="show" id="${user.id}">${user.username}</g:link>
	</td>
	<td>
		<g:if test="${user.team != null}">
			<g:link controller="team" action="show" id="${user.team.id}">${user.team.name}</g:link>
			<g:if test="${user.team.leader.id == user.id}">
				(captain)
			</g:if>
		</g:if>
	</td>
	<td>
		${user.getTotalKm()}
	</td>
	<td>
		${user.getCyclingDays()}
	</td>
</tr>