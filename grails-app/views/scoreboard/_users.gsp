<tr>
	<td>
		${user.username}
	</td>
	<td>
		<g:if test="${user.team != null}">
			${user.team.name}
		</g:if>
		<g:if test="${user.team.leader.id == user.id}">
			(captain)
		</g:if>
	</td>
	<td>
		${user.getTotalKm()}
	</td>
</tr>