
require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
number = SECRET_NUMBER


get '/' do
  guess   = params["guess"].to_i
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

  def check_guess(guess, number)
    if (guess > number) && (guess < (number + 5))
      "Too high!"
    elsif (guess > number) && (guess > (number + 5))
      "Way too high!"
    elsif (guess < number) && (guess > (number - 5))
      "Too low!"
    elsif (guess < number) && (guess < (number -5))
      "Way too low!"
    else
      "You got it right!\n The SECRET NUMBER is #{number}"
    end
  end
