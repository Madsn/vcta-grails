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

### User script
(work in progress)
```
#!/bin/bash
apt-get -y update
apt-get -y install unzip git postgresql postgresql-contrib htop
iptables -A INPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state ESTABLISHED -j ACCEPT
iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
```

### Postgres

1. Install postgres - `apt-get install postgresql postgresql-contrib`
2. Open firewall access to ports (for connecting with pgadmin remotely)
  - `iptables -A INPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state NEW,ESTABLISHED -j ACCEPT`
  - `iptables -A OUTPUT -p tcp -s 0/0 --sport 5432 -d 0/0 --dport 5432 -m state --state ESTABLISHED -j ACCEPT` 
3. `apt-get install iptables-persistent` to persist iptables changes
4. Add following lines to '/etc/postgresql/9.3/main/pg_hba.conf'
  - `host    all             all             0.0.0.0/0            md5`
5. Set following in `/etc/postgresql/9.3/main/postgresql.conf`
  - `listen_addresses = '*'`
6. Restart postgresql `service postgresql restart`
7. Create vcta user - `adduser vcta`
8. Switch to postgres user - `sudo -i -u postgres`
9. Create vcta role - `createuser vcta` (to set a password, enter psql console and enter `alter user vcta with password 'XXX';`)
10. Create db - `createdb vcta`
11. It should now be possible to connect with pgadmin3 for user vcta

### Java 8 jdk

1. add-apt-repository ppa:openjdk-r/ppa
2. apt-get update
3. apt-get install openjdk-8-jdk
4. update-alternatives --config java
5. update-alternatives --config javac

### Grails

1. `apt-get install unzip git`
2. `curl -s http://get.sdkman.io | bash`
3. `sdk i grails 2.2.5`
4. `echo "DATABASE_URL='postgres://vcta:XXXX@localhost:5432/vcta'" >> /etc/environment`
5. git clone (repo url)
 
### Jetty

1. `apt-get install jetty libjetty8-extra-java libjetty8-java libjetty-extra-java libjetty-extra libjetty-java-doc jetty8 libjetty8-java-doc libjetty-java jsvc apache2-utils adduser`
2. Edit /etc/default/jetty - set JETTY_HOST=0.0.0.0, JETTY_PORT=8080, NO_START=0 and change java opts to set -Xmx=192m
3. Redirect port 80 to 8080: `iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080`
4. Persist above rule with `service iptables-persistent save`

### Postfix

1. `apt-get install postfix` - "internet site", "systematic-pf.dk"

### Deploy

- `grails war /var/lib/jetty/webapps/root.war`
- `service jetty restart`
- logs are found in `/usr/share/jetty/logs`

## Alternative hosting

Another good hosting option would be [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/). This would require making changes to the DataSource.groovy file.

