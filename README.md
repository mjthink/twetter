twitter-clone
=============

This is the sample Twitter Clone code base for Thinkful's Ruby on Rails course.

Before Beginning
-------------

Ensure you have the latest version of Ruby Version Manager (RVM) and ruby 2.0.0-p247 installed.

```sh
# If you do not have RVM installed, you can do so as follows
\curl -L https://get.rvm.io | bash -s stable

# If you already have RVM install, make sure it's up to date
rvm get head # rvm update for older versions

# Install the most recent Ruby 2.0.0 package
rvm install ruby-2.0.0
```

Getting Started
-------------

```sh
# Clone the repository
git clone git@github.com:bluefocus/twitter-clone.git

cd ./twitter-clone

# Install the required gems
bundle install

# Set up the database
bundle exec rake db:create db:migrate db:test:prepare
```

Run the Tests
-------------

```sh
bundle exec rspec
```
