<tr>
	<td>
		${trip.id}
	</td>
	<td>
		${trip.distanceKm}
	</td>
	<td>
		${trip.startTime }
	</td>
	<td><g:link controller="trip" action="delete" id="${trip.id}">Delete</g:link></td>
<tr>