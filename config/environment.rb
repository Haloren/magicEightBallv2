ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# set :environment, ENV['SINATRA_ENV'].to_sym

# database_config = {
#   :development => {
#     :adapter => "sqlite3",
#     :database => "db/#{ENV['SINATRA_ENV']}.sqlite"  
#   }
# }

if ENV["SINATRA_ENV"] == "development"
  require_relative "../secrets"
end

# set :database, database_config

set :database_file, "./database.yml"

require './app/controllers/application_controller'
require_all 'app'