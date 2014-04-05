<g:set var="team" value="${user.team}"/>
<p>team: ${team.name}, leader: ${team.leader.username}, total km: ${team.getTotalKm() }</p>
<g:if test="${team.leader == user}">
<g:link controller="team" action="delete" id="${team.id}">Disband team</g:link>
</g:if>
<p>Members:</p>
<g:each var="member" in="${team.getMembers()}">
	<p>Member: ${member.username}</p>
</g:each>