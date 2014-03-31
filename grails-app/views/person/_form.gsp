



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="person.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="team" name="team.id" from="${Team.list()}" optionKey="id" required="" value="${personInstance?.team?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="person.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${personInstance?.userName}"/>

</div>

