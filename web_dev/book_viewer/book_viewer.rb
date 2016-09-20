require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do 
	@contents = File.readlines("data/toc.txt") #saved as an array
end 

get "/" do
	@title = "The Adventures of Sherlock Holmes"

  erb :home
end 

get "/chapters/:number" do
	
	number = params[:number].to_i 
	chapter_name = @contents[number -1]
	@title = "Chapter #{number}: #{chapter_name}" 

	@chapter = File.read("data/chp#{number}.txt")

	erb :chapter 
end 

not_found do
	redirect "/"
end 

helpers do 
  

  def each_chapter(&block)
  	@contents.each_with_index do |name, index|
	  	number = index + 1 
	  	contents = File.read("data/chp#{number}.txt")
	  	yield number, name, contents
  	end
  end  

	def chapters_matching(query)
	  results = []

	  return results unless query

	  each_chapter do |number, name, contents|
	    matches = {}
	    contents.split("\n\n").each_with_index do |paragraph, index|
	      matches[index] = paragraph if paragraph.include?(query)
	    end
	    results << {number: number, name: name, paragraphs: matches} if matches.any?
	  end

	  results
	end

	def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end 

get "/search" do
	@results = chapters_matching(params[:query])
	erb :search 
end 