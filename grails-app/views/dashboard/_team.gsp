<g:set var="team" value="${user.team}" />
<p>
	${team.name}, leader:
	${team.leader.username}, total km:
	${team.getTotalKm() }

</p>
<g:if test="${team.leader == user}">
	<g:link controller="team" action="delete" id="${team.id}">Disband team</g:link>
</g:if>
<g:if test="${team.leader != user}">
	<g:link controller="team" action="removefromteam"
		params="${[userid: user.id, teamid: team.id]}">Leave team</g:link>
</g:if>
<h4>Members:</h4>
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>Username</th>
			<th>Total km</th>
			<g:if test="${team.leader == user}">
				<th></th>
				<th></th>
			</g:if>
		</tr>
	</thead>
	<tbody>
		<g:each var="member"
			in="${team.getUsers().sort{a,b -> a.username > b.username ? 1 : -1}}">
			<tr>
				<g:if test="${team.leader.id == member.id }">
					<td><strong> ${member.username}
					</strong> (team captain)</td>
				</g:if>
				<g:if test="${team.leader.id != member.id }">
					<td>
						${member.username}
					</td>
				</g:if>
				<td>
					${member.getTotalKm()}
				</td>
				<g:if test="${team.leader == user}">
					<g:if test="${member == user }">
						<td></td>
						<td></td>
					</g:if>
					<g:if test="${member != user }">
						<td><g:link controller="team" action="removefromteam"
								params="${[userid: member.id, teamid: team.id]}">Remove</g:link></td>
						<td><g:link controller="team" action="transferleadership"
								params="${[userid: member.id, teamid: team.id]}">Transfer leadership</g:link></td>
					</g:if>
				</g:if>
			</tr>
		</g:each>
	</tbody>
</table>