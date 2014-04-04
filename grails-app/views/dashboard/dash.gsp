<!doctype html>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="grails.plugin.nimble.core.UserBase"%>
<html>
    <head>
        <title>Dashboard</title>
        <meta name="layout" content="app" />
    </head>
    <body>
    <p>Trips</p>
    <g:each in="${user.trips.sort{a,b -> a.startTime > b.startTime ? -1 : 1}}">
    <g:render template="trips" collection="${it}" />
    </g:each>
    <br/>
    <p>Team:</p>
    <g:render template="team" collection="${user.team}" />
    <br/>
    <p>My stats:</p>
    <p>${user.username }</p>
    <!-- <p>Team: {currentUser.team.name }</p>-->
    <p>Total distance: ${user.getTotalKm() }</p>
    </body>
</html>