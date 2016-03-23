# Dreameater

## [Check out our app](http://dreameater.herokuapp.com/)

## General info

The purpose of this app is to log & share your dreams.

## Features
* signed in user can add new dream
* dream is automatically assigned to current user (signed in user)
* only dream owner can edit & update dream
* user can stalk other users
* user can see board with dreams of stalked users
* user can see board of his own dreams
* user can set dream as hidden (not showed for other users)
* dream can be liked/disliked by other users (not dreamer)
* dream has shown points
* user can see top dreams of stalked users

out of mvp:
* user can see top dreams of his own
* user can add tags to his dreams
* user can search for dreams by contextual search including title & description
* user can search dreams by tags
* user can see most popular tags
* app is mobile friendly (for easier dream logging just after dream)

idea:
* api for mobile app
* mobile app integrated with alarm clock (option for inserting dream after alarm goes off - fresh memory of dream)

## Technologies

* Ruby on Rails 4.2.6
* Ruby 2.3.0
* Postgresql
* HAML
* Bootstrap 3
* Devise authentication
* Pundit authorization
* Continous deployment with Travis and Heroku
* Code Climate quality check

## Setup
### Clone repository
`git clone git@github.com:fantasygame/dreameater.git`

### Download gems
`bundle install`

### Install database (postgresql)

Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04

OSX: http://postgresapp.com/

### Create postgresql superuser dreameater.

To do that you can use interactive psql command
`createuser --interactive`

### Copy config
`cp config/database.example.yml config/database.yml`

`cp config/application.example.yml config/application.yml`

### Setup database
`rake db:setup`

## Tests
We use RSpec 3 for backend testing.

## Development (fantasygame team)
* Make sure that you have your email and name set in git on your machine. It won't recognize your commits if you don't do this. https://help.github.com/articles/setting-your-email-in-git/
* Make sure to connect your machine to github by ssh https://help.github.com/articles/generating-ssh-keys/
* Don't fork the project. We use one-repo single-branch approach for rapid development.
* Every commit is reviewed by the other team member. Make sure to fix any issue that is found.
* We use rubocop to mantain high code quality. Make sure to follow its advices. Install rubocop plugin to your editor.
* Make your best to write tests for your code. You can check code coverage in codeclimate.
* We don't like merge commits. Use rebase. `bash git config --global branch.autosetuprebase always `

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.
* Please follow Ruby style guide available [here](https://github.com/bbatsov/ruby-style-guide) and rubocop.yml

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

## License

MIT

## Authors

* Adam Roszkiewicz
* Dawid Roszkiewicz
* Małgorzata Grobelska
* Jakub Kubacki
