<!doctype html>
<html>
    <head>
        <title>Dashboard</title>
        <meta name="layout" content="app" />
    </head>
    <body>
    <p style="color:red;">${error}</p>
    <p style="color:blue;">${msg}</p>
    <h2>Trips <g:link controller="trip" action="create">Add</g:link></h2>
    <g:each in="${user.trips.sort{a,b -> a.startTime > b.startTime ? -1 : 1}}">
    <g:render template="trips" bean="${it}" var="trip" />
    </g:each>
    <br/>
    <h2>Team:</h2>
    <g:if test="${user.team == null }">
    <g:render template="noteam" collection="${user }" />
    </g:if>
    <g:if test="${user.team != null }">
    <g:render template="team" collection="${user }" />
    </g:if>
    <br/>
    <g:if test="${user.invitations == null }" >
    <p>You currently have no team invitations</p>
    </g:if>
    <g:if test="${user.invitations.size() > 0 }" >
    <p>You have the following team invitations:</p>
    <g:render template="invitations" collection="${user.invitations}" />
    </g:if>
    <br/>
    <h2>My stats:</h2>
    <g:render template="stats" collection="${user}" />
    </body>
</html>