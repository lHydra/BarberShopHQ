require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershopHQ.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	erb :index
end