<g:if test="${user.trips.size() > 0}">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Day (May 2014)</th>
				<th>Distance</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="trip"
				in="${user.trips.sort{a,b -> a.date > b.date ? -1 : 1}}">
			<tr>
				<g:render template="/trip/triprow" bean="${trip}" var="trip" />
				<td>
					<g:link controller="trip" action="edit" id="${trip.id}"><i class="glyphicon glyphicon-pencil"></i></g:link>
				</td>
				<td>
					<g:link controller="trip" action="delete" id="${trip.id}"><i class="glyphicon glyphicon-remove"></i></g:link>
				</td>
			</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:if test="${!(user.trips.size() > 0)}">
	No trips registered
</g:if>