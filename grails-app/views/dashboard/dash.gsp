<!doctype html>
<html>
    <head>
        <title>Dashboard</title>
        <meta name="layout" content="app" />
    </head>
    <body>
    <p>Trips <g:link controller="trip" action="create">Add</g:link></p>
    <g:each in="${user.trips.sort{a,b -> a.startTime > b.startTime ? -1 : 1}}">
    <g:render template="trips" collection="${it}" />
    </g:each>
    <br/>
    <p>Team:</p>
    <g:if test="${user.team == null }">
    <g:render template="noteam" collection="${user }" />
    </g:if>
    <g:if test="${user.team != null }">
    <g:render template="team" collection="${user.team}" />
    </g:if>
    <br/>
    <g:if test="${user.invitations == null }" >
    <p>You currently have no team invitations</p>
    </g:if>
    <g:if test="${user.invitations != null }" >
    <p>You have the following team invitations:</p>
    <g:render template="invitations" collection="${user.invitations}" />
    </g:if>
    <br/>
    <p>My stats:</p>
    <g:render template="stats" collection="${user}" />
    </body>
</html>