
<g:form controller="team" action="save" name="team-create-form" method="post"
	class="form-inline">
	<fieldset>
		<div class="form-group">
			<label class="control-label" for="name">Team name </label> <input
				type="text" id="name" name="name" class="form-control"
				value="${fieldValue(bean: team, field: 'name')}" />
		</div>
		<div class="form-group">
			<input type="button"
				onclick="$('#createteambtn').show();$('#createteamform').hide();"
				class="btn btn-danger" value="Cancel" />
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</fieldset>
</g:form>
