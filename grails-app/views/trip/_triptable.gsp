<g:if test="${user.trips.size() > 0}">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Day (May 2014)</th>
				<th>Distance</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="trip"
				in="${user.trips.sort{a,b -> a.date > b.date ? -1 : 1}}">
				<g:render template="/trip/triprow" bean="${trip}" var="trip" />
			</g:each>
		</tbody>
	</table>
</g:if>
<g:if test="${!(user.trips.size() > 0)}">
	No trips registered
</g:if>