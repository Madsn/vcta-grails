<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>Username</th>
			<th>Total km</th>
			<th>Cycling days</th>
		</tr>
	</thead>
	<tbody>
		<g:each var="member"
			in="${team.getUsers().sort{a,b -> a.username > b.username ? 1 : -1}}">
			<tr>
				<td><g:link controller="member" action="show" id="${member.id}">
						<g:if test="${team.leader.id == member.id }">
							<strong>
								${member.username}
							</strong> (team captain)
						</g:if>
						<g:if test="${team.leader.id != member.id }">
							${member.username}
						</g:if>
					</g:link></td>
				<td><g:formatNumber number="${member.getTotalKm()}"
						format="0.00" /></td>
				<td>
					${member.getCyclingDays()}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>