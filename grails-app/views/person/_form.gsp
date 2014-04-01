



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'team', 'error')} ">
	<label for="team">
		<g:message code="person.team.label" default="Team" />
		
	</label>
	<g:select id="team" name="team.id" from="${Team.list()}" optionKey="id" value="${personInstance?.team?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${personInstance?.name}"/>
</div>

