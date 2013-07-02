sinatra-with-activerecord-example
=================================

GA WDI Summer 2012. Moving from writing our own SQL to AR before we jump into Rails

Using the activerecord-sinatra gem. Docs at: https://github.com/janko-m/sinatra-activerecord

Make sure you run `bundle install`

Create your database

    createdb guitar_development_new

Create a migration for guitars

    rake db:create_migration NAME=create_guitars

Run your migrations

    rake db:migrate

To revert

    rake db:rollback