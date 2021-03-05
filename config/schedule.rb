# If this app would be deployed, I wouldn't make the environment variable like this
# But since this is only a test, I took the freedom to make it easyer to everyone :)
set :environment, 'development'
set :output, "log/whenever.log"

job_type :bill, '/usr/local/bin/rake :task RAILS_ENV=:env'

every 1.day, at: '7:00 am' do
  bill "routines:bill_clients", env: environment
end
