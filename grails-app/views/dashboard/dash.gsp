<html>
    <head>
        <title>Dashboard</title>
        <meta name="layout" content="app" />
    </head>
    <body>
    <p>Users:</p>
    <g:render template="users" collection="${users}" />
    <p>Teams:</p>
    <g:render template="teams" collection="${teams}" />
    </body>
</html>