<g:set var="team" value="${user.team}" />
<p>
	team:
	${team.name}, leader:
	${team.leader.username}, total km:
	${team.getTotalKm() }

</p>
<g:if test="${team.leader == user}">
	<g:link controller="team" action="delete" id="${team.id}">Disband team</g:link>
	<g:link controller="invitation" action="create"
		params="${[userid: 1, teamid: team.id]}">Invite user</g:link>
</g:if>
<g:if test="${team.leader != user}">
	<g:link controller="team" action="removefromteam"
		params="${[userid: user.id, teamid: team.id]}">Leave team</g:link>
</g:if>
<p>Members:</p>
<g:each var="member"
	in="${team.getUsers().sort{a,b -> a.username > b.username ? 1 : -1}}">
	<p>
		<g:if test="${team.leader.id == member.id }">
Leader: 
</g:if>
		<g:if test="${team.leader.id != member.id }">
Member: 
</g:if>
		${member.username}
		<g:if test="${team.leader == user && member != user}">
			<g:link controller="team" action="removefromteam"
				params="${[userid: member.id, teamid: team.id]}">Remove</g:link>
	 - <g:link controller="team" action="transferleadership"
				params="${[userid: member.id, teamid: team.id]}">Transfer leadership</g:link>
		</g:if>
	</p>
</g:each>
<g:if test="${user.id == team.leader.id }">
	<g:link controller="invitation" action="create" params="${[teamid: team.id, userid: 1]}">Invite</g:link>
	<g:if test="${team.pendingInvitations.size() > 0}">
		<p>Pending invitations:</p>
		<g:each var="invitation" in="${team.pendingInvitations }">
			${invitation.invitee.username} - <g:link controller="invitation" action="dismiss" id="${invitation.id}">Cancel</g:link>
		</g:each>
	</g:if>
</g:if>