<p>team: ${team.name}, leader: ${team.leader.username}</p>
<p>Members:</p>
<g:each var="user" in="${team.getMembers()}">
	<p>Member: ${user.username}</p>
</g:each>