vcta-grails
===========

## What is it?
A website to manage a "bike to work month" competition (running in may every year in Denmark).

### Screenshots

#### Login
![Login screenshot](/screenshots/login.PNG?raw=true "Login page")
#### Dashboard
![Dashboard screenshot](/screenshots/dashboard.PNG?raw=true "Dashboard")
#### Scoreboard
![Scoreboard screenshot](/screenshots/scoreboard.PNG?raw=true "Scoreboard")

## TODO / wish list

- Inline editing of trips.
- Account management access from menu (views already exist, we just need a dropdown in the menu next to "log out")
- Figure out how best to handle group minimum of 5.. Perhaps exclude the group from the team scoreboard if less than 5 members?
- Admin interface for managing groups (bonus: ability to randomly group individuals without a group)
- "Freeze" feature. Allow admin to freeze all changes, i.e. no editing/adding trips and no signups.
- Admin interface for setting welcome/login messages that are loaded dynamically.
- Calculate scoreboard state once daily instead of on each page load.
- Fetch latest workouts from endomondo and allow users to import a workout as a trip.
- Comparison of team/individual stats with the official VCTA.
- Refactoring/cleanup, especially in `/views`.
- Replace nimble with direct apache shiro
- Calendar/datepicker for registering trips form

## Getting started on development

1. Download grails 2.2.5, unpack somewhere
2. Create `GRAILS_HOME` environment variable, pointed to the grails-2.2.5 folder
3. Add `%GRAILS_HOME%\bin` to system path
4. Checkout git repository
5. Inside repo folder, open the grails console from cmd/terminal: `grails`
6. Run the app: `run-app`

## Deployment (heroku)

[Grails deployment on heroku](https://devcenter.heroku.com/articles/getting-started-with-grails#set-up-the-database)

1. Install heroku toolbelt
2. `heroku create APP_NAME_HERE --region eu`
3. `heroku addons:add heroku-postgresql`
4. `heroku addons:add mandrill` - this is the mail provider. Attaching mandrill to the app will automatically create the environment variables needed for e-mail sending to work
5. (optional - postgresql backups) `heroku addons:add pgbackups:auto-month` requires CC info is entered for heroku account

Deploy with `git push heroku master`

### Heroku free tier performance

Current memory limit for the free dyno (1X) is 512 mb ram. If you modify the JAVA_OPTS environment variable, setting `-Xmx128m`, it should be able to run within the limit. The app can still run even though it exceeds the memory limit, but performance will be [degraded](https://devcenter.heroku.com/articles/error-codes#r14-memory-quota-exceeded).

After around 1 hour with no requests, heroku will put the app in an idle state to save resources. The first request that wakes it from this state will have a long response time.

## DigitalOcean

### Postgres/Tomcat

1. Setup droplet with tomcat - [use this droplet](https://github.com/digitalocean/do_user_scripts/blob/master/Ubuntu-14.04/web-servers/tomcat7.yml)
2. Install postgres - `apt-get install postgresql postgresql-contrib`
3. Open firewall access to ports (for connecting with pgadmin remotely)
  - `iptables -A INPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state NEW,ESTABLISHED -j ACCEPT`
  - `iptables -A OUTPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state ESTABLISHED -j ACCEPT` 
4. `apt-get install iptables-persistent` to persist iptables changes
5. Add following lines to '/etc/postgresql/9.3/main/pg_hba.conf' (and restart postgresql service)
  - `listen_addresses = '*'`
  - `host    all             all             0.0.0.0/0            md5`
6. Create vcta user - `adduser vcta`
7. Switch to postgres user - `sudo -i -u postgres`
8. Create vcta role - `createuser vcta` (to set a password, enter psql console and enter `alter user vcta with password 'XXX';`)
9. Create db - `createdb vcta;`
10. It should now be possible to connect with pgadmin3 for user vcta
11. Increase java heap space for tomcat by setting -Xmx=192m -XX:MaxPermSize=128m in JAVA_OPTS in /etc/default/tomcat7
12. In /etc/default/tomcat7 set `authbind=yes` (to allow binding to port 80)
13. Run following commands:
  - `apt-get install authbind`
  - `sudo touch /etc/authbind/byport/80`
  - `sudo chmod 500 /etc/authbind/byport/80`
  - `sudo chown tomcat7 /etc/authbind/byport/80`
14. In /var/lib/tomcat7/conf/server.xml, change the connector to use port 80, and add the following:
  - ```<Context path="" docBase="vcta" debug="0" reloadable="true">
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
</Context>
<Context path="/ROOT" docBase="ROOT">
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
</Context>```


### Grails


1. `curl -s http://get.sdkman.io | bash`
2. `sdk i grails 2.2.5`
3. `echo "DATABASE_URL='postgres://vcta:XXXX@localhost:5432/vcta'" >> /etc/environment`

## Alternative hosting

Another good hosting option would be [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/). This would require making changes to the DataSource.groovy file.

