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
    <g:render template="team" collection="${user.team}" />
    <br/>
    <p>My stats:</p>
    <g:render template="stats" collection="${user}" />
    </body>
</html>