
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

@correct = false
@wrong = false
@way_too_wrong = false

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

  def check_guess(guess)
    if guess == SECRET_NUMBER
      @correct = true
      message = "You got it right\n the SECRET NUMBER is #{SECRET_NUMBER}"
    elsif guess > SECRET_NUMBER + 5
      @way_too_wrong = true
      message = "Way to high!"
    elsif guess < SECRET_NUMBER - 5
      @way_too_wrong = true
      message = "Way too low!"
    elsif guess > SECRET_NUMBER
      @wrong = true
      message = "Too high!"
    elsif guess < SECRET_NUMBER
      @wrong = true
      message =  "Too low!"
    end
  end
