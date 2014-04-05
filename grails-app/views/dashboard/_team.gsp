<g:set var="team" value="${user.team}"/>
<p>team: ${team.name}, leader: ${team.leader.username}, total km: ${team.getTotalKm() }</p>
<g:if test="${team.leader == user}">
<g:link controller="team" action="delete" id="${team.id}">Disband team</g:link>
</g:if>
<p>Members:</p>
<g:each var="member" in="${team.getMembers().sort{a,b -> a.username > b.username ? 1 : -1}}">
	<p>Member: ${member.username} <g:if test="${team.leader == user}"><g:link controller="team" action="removefromteam" params="${[userid: member.id, teamid: team.id]}">Remove</g:link></g:if></p>
</g:each>