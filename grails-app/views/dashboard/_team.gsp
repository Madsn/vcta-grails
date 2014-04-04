<p>team: ${team.name}, leader: ${team.leader.username}, total km: ${team.getTotalKm() }</p>
<p>Members:</p>
<g:each var="user" in="${team.getMembers()}">
	<p>Member: ${user.username}</p>
</g:each>