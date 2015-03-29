<g:hasErrors bean="${bean}">
	<div class="alertcontainer">
		<div class="alert alert-danger" role="alert">
			<a class="close" data-dismiss="alert" href="#">×</a>
			<h5 class='alert-heading'>
				<g:message code="nimble.label.error" />
			</h5>
			<g:renderErrors bean="${bean}" as="list" />
		</div>
	</div>
</g:hasErrors>

