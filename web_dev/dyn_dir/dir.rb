require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do 
	@dir = Dir.entries("public").sort
	@dir.reverse! if params[:sort] == "desc"
	
	erb :home 
end 

