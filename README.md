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

## Deployment (heroku)

[Grails deployment on heroku](https://devcenter.heroku.com/articles/getting-started-with-grails#set-up-the-database)

1. Install heroku toolbelt
2. `heroku create vcta-2014 --region eu`
3. `heroku addons:add heroku-postgresql`
4. `heroku addons:add pgbackups:auto-month` requires CC info is entered for heroku account

Deploy with `git push heroku master`
