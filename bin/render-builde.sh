set -o errexit

bundle install
npm cache clean
npm install
bundle exec rake assets:precompile
bundle exec rake db:migrate
bundle exec rake db:seed
