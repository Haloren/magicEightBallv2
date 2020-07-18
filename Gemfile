source 'http://rubygems.org'

gem "sinatra", "~> 2.0"

gem "activerecord", "~> 6.0", :require => 'active_record'

gem "sinatra-activerecord", "~> 2.0", :require => 'sinatra/activerecord'

gem "rake", "~> 13.0"

gem "require_all", "~> 3.0"

gem "bcrypt", "~> 3.1"

group :development, :test do 
    gem 'sqlite3'    

    gem "shotgun", "~> 0.9.2"
    
    gem "pry", "~> 0.13.1"

end

group :production do 
  
    gem 'pg'        

end