vcta-grails
===========

## TODO

- Figure out how best to handle group minimum of 5.. Perhaps exclude the group from the team scoreboard if less than 5 members?
- Performance: Calculate scoreboard state once daily instead of on each page load.
- Inline editing of trips

## Getting started on development

1. Download grails 2.2.5, unpack somewhere
2. Create `GRAILS_HOME` environment variable, pointed to the grails-2.2.5 folder
3. Add `%GRAILS_HOME%\bin` to system path
4. Checkout git repository
5. Inside repo folder, open the grails console from cmd/terminal: `grails`
6. Run the app: `run-app`

## Deployment (ubuntu)

1. `apt-get install openjdk-7-jdk curl`
2. `curl -s get.gvmtool.net | bash`
3. As per instructions after installing gvmtooll: `source "/root/.gvm/bin/gvm-init.sh"`
4. `gvm install grails 2.2.5`
5. Clone repo
6. `grails run-war` from repo dir

### With tomcat

1. `apt-get install tomcat7 tomcat7-admin`
2. add a user in `/etc/tomcat7/tomcat-users.xml` with the `manager-gui` and `admin-gui` roles
3. change tomcat port from 8080 to 80 in `/etc/tomcat7/server.xml` (make sure nothing else is using port 80, or redirect from apache/nginx to tomcat running on another port)
4. set `AUTHBIND=yes` in `/etc/default/tomcat7`
5. `/etc/init.d/tomcat7 restart`
6. in a browser, open 'server-url/manager/html' and deploy the .war generated by `grails war`

default directory for tomcat logfiles is `/var/lib/tomcat7/logs/`
