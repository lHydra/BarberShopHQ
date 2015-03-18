require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershopHQ.db"

class Client < ActiveRecord::Base
validates :name, :presence => true
validates :phone, :presence => true
validates :datestamp, :presence => true
validates :color, :presence => true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

c=Client.new params[:client]
c.save

erb 'Отлично! Ожидайте звонка'
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

  c=Contact.new params[:contacts]
  c.save
  erb 'Отлично! Ваше письмо будет рассмотрено в течение 3х рабочих дней.'
end