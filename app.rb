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
validates :email, :presence => true
validates :text, :presence => true
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
if c.save
	erb 'Отлично! Ожидайте звонка'
else
	@error = c.errors.full_messages.first
	erb :visit
end
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

  c=Contact.new params[:contacts]
  if c.save
 	 erb 'Отлично! Ваше письмо будет рассмотрено в течение 3х рабочих дней.'
  else
  	 @error = c.errors.full_messages.first
  	 erb :contacts
  end

end

get '/barbers/:id' do
	@barber = Barber.find(params[:id])
	erb :barbers
end

get '/bookings' do
	@clients = Client.order('created_at DESC')
	erb :bookings
end

get '/clients/:id' do
	@client = Client.find(params[:id])
	erb :clients
end