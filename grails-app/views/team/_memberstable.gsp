<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>Username</th>
			<th>Total km</th>
			<th>Cycling days</th>
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
				<td>
					<g:link controller="user" action="show" id="${member.id}">
						<g:if test="${team.leader.id == member.id }">
							<strong>${member.username}</strong> (team captain)
						</g:if> 
						<g:if test="${team.leader.id != member.id }">
							${member.username}
						</g:if>
					</g:link> 
				</td>
				<td>
					${member.getTotalKm()}
				</td>
				<td>
					${member.getCyclingDays()}
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