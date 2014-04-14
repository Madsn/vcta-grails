<p>
	${user.username }
</p>
<p>
	Total distance:
	${user.getTotalKm() }
</p>
<p>
	Number of trips:
	${user.trips.size() }
</p>
<p>
	Team:
	<g:link controller="team" action="show" id="${user.team?.id}">${user.team?.name}</g:link>
</p>