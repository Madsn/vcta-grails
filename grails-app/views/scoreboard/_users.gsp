<tr>
	<td>
		${user.username}
	</td>
	<td>
		<g:if test="${user.team != null}">
			${user.team.name}
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