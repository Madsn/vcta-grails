



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="team.members.label" default="Members" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.members?}" var="m">
    <li><g:link controller="person" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="person" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'person.label', default: 'Person')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'leader', 'error')} required">
	<label for="leader">
		<g:message code="team.leader.label" default="Leader" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leader" name="leader.id" from="${Person.list()}" optionKey="id" required="" value="${teamInstance?.leader?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${teamInstance?.name}"/>
</div>

