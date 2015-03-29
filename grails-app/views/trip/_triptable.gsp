<g:if test="${user.trips.size() > 0}">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Day (May 2015)</th>
				<th>Distance</th>
			</tr>
		</thead>
		<tbody>
			<g:each var="trip"
				in="${user.trips.sort{a,b -> a.date > b.date ? -1 : 1}}">
				<tr>
					<g:render template="/trip/triprow" bean="${trip}" var="trip" />
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:if test="${!(user.trips.size() > 0)}">
	No trips registered
</g:if>
