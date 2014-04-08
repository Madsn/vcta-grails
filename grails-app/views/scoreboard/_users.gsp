<tr>
	<td>
		${user.username}
	</td>
	<td><g:if test="${user.team != null}">
			${user.team.name}
		</g:if></td>
	<td>
		${user.getTotalKm()}
	</td>
</tr>