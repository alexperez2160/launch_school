require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "yaml"

before do 
	@user_info = Psych.load_file('data/users.yaml')
end 

get "/" do 
	erb :home
end 

get "/:name" do 

	erb :user
end 

helpers do 
	def count_interests(var)
		names = var.keys
		arr = []
		names.each {|my_users| arr << var.fetch(my_users).fetch(:interests)}
		arr.flatten.length
	end 

	def count_users(var)
		var.keys.length
	end 

end 

