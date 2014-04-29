<html>

<head>

</head>

<body>
	
	<p>
		You have been invited to join a team. Log in on <a href='<g:createLink uri="/" absolute="true"/>'>${grailsApplication.config.grails.serverURL}</a> to accept or decline the invitation.
	</p>
	<p>
		Invitation info:<br/>
		Inviting team: <a href='<g:createLink controller="team" action="show" absolute="true" id="${invitation.team.id}"/>'>${invitation.team.name}</a><br/>
		Team captain: <a href='<g:createLink controller="member" action="show" absolute="true" id="${invitation.team.leader.id}"/>'>${invitation.team.leader.username}</a>
	</p>

</body>

</html>