web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq
worker: bundle exec rake sneakers:run
release: bundle exec rake db:migrate
