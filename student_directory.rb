require 'rubygems'
require 'sinatra'
# require 'sinatra/reloader'
require 'sqlite3'
require 'rack-flash'
require 'pry'

# Pull in each of our class files
require_relative 'person'
require_relative 'student'
require_relative 'instructor'

enable :sessions
use Rack::Flash

# Now the program actually starts here.
before '/' do 
  unless params[:password] == "1"
  flash[:notice] = "Sorry, wrong password! Try again."
  redirect '/login'
  end
end

before '/index' do 
  unless params[:password] == "1"
  flash[:notice] = "Sorry, wrong password! Try again."
  redirect '/login'
  end
end

post '/index' do
  erb :index
end

#sends you to the student or instructor page depending on your entry, my case insensitive trick from the ruby clie doesnt work here.
post '/result' do
      erb :result
  if "#{params[:id]}" == "Student"
    @choosen_id = params[:id]
    redirect '/student'
  elsif "#{params[:id]}" == "Instructor"
    @choosen_id = params[:id]
    redirect '/instructor'
  else
    flash[:notice] = "Please enter 'student' or 'instructor!"

  end
end


get '/index' do
  erb :index
end

get '/instructor' do
  erb :instructor
end

get '/student' do
  erb :student
end

post '/entry' do
    #create an empty array to hold all the data the user entered from the instructor or student .erb page
  someonex = []
  someonex << [params[:id].to_i, params[:twitter], params[:name], params[:email], params[:reason], params[:iq]]
  #we need to convert this from a 2d array to a 1d array, flatten takes care of that
  someone = someonex.flatten
  #now that we have all the data we can create a new student, execution jumps to person.rb
  Student.new(someone)
#make sure to let the user know their data was entered and they will be spammed to death!
  flash[:notice] = "Thank you for entering your info, we will begin spamming you shortly"
end

get '/login' do
  erb :login
end
