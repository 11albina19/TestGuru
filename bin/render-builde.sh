set -o errexit

bundle install
npm cache clean --force
npm install
bundle exec rake assets:precompile
bundle exec rake db:migrate
bundle exec rake db:seed
