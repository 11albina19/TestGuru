set -o errexit

bundle install

#rails importmap:install
#rails turbo:install
#rails stimulus:install

bundle exec rake assets:precompile
bundle exec rake db:migrate
