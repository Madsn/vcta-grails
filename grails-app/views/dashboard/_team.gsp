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
<g:render template="/team/memberstable" bean="${team}" />