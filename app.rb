require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershopHQ.db"

class Client < ActiveRecord::Base
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
hh = {:name => 'Введите имя', :date => 'Введите дату', :email => 'Введите почту'}
@name = params[:name]
@date = params[:date]
@email = params[:email]
@barber = params[:barber]
@color = params[:colorpicker]

c=Client.new :name=>@name, :phone=>@email, :datestamp=>@date, :barber=>@barber,:color=>@color
c.save

@error = hh.select{|key,_| params[key] == ""}.values.join(", ") 

if @error != ''
  return erb :visit
end

erb 'Отлично! Ожидайте звонка'
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
  @email_c = params[:email_contacts]
  @message = params[:textarea]
  c=Contact.new :email=>@email_c, :text=>@message
  c.save
  erb 'Отлично! Ваше письмо будет рассмотрено в течение 3х рабочих дней.'
end