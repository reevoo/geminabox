#!/bin/sh
set -xe

# runs on code / no need db
bundle exec reevoocop

bundle exec ruby-audit check
bundle exec bundle-audit check --update

# wait for database to be created
sleep 5
# bootstrap data store
bundle exec slodd -g reevoo/revieworld -t c433ef4ebba939bdf20f72627dd137904c44f28a
bundle exec rake db:migrate
bundle exec rake db:test:prepare

# running actual tests
bundle exec rake
