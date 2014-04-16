<table class="table table-hover">
	<thead>
	</thead>
	<tbody>
		<tr>
			<td>Total distance</td>
			<td><g:formatNumber number="${user.getTotalKm() }" format="0.00" />
				km</td>
		</tr>
		<tr>
			<td>Number of trips</td>
			<td>
				${user.trips.size() }
			</td>
		</tr>
		<tr>
			<td>Cycling days</td>
			<td>
				${user.getCyclingDays() }
			</td>
		</tr>
		<tr>
			<td>Team</td>
			<td><g:link controller="team" action="show"
					id="${user.team?.id}">
					${user.team?.name}
				</g:link></td>
		</tr>
	</tbody>
</table>
