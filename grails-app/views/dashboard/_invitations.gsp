<td>${invitation.team.name}</td>
<td>${invitation.team.leader.username}</td>
<td><g:link controller="invitation" action="accept" id="${invitation.id }"><i class="glyphicon glyphicon-ok" title="Accept"></i></g:link></td>
<td><g:link controller="invitation" action="dismiss" id="${invitation.id}"><i class="glyphicon glyphicon-remove" title="Dismiss"></i></g:link></td>
