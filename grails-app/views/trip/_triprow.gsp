<tr>
	<td>
		<g:formatDate format="dd" date="${trip.date}" />
	</td>
	<td>
		${trip.distanceKm}
	</td>
	<td><g:link controller="trip" action="delete" id="${trip.id}">Delete</g:link></td>
<tr>