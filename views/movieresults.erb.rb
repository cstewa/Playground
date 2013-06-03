require "sinatra"
require "sinatra/reloader"
require "movies"
require "stock_quote"
require "image_suckr"


get "/" do
	erb :index
end

get "/movies" do
		erb :movies
end 

get "/movieresults" do
		@movie_result = Movies.find_by_title(params[:movie_name])

	  suckr = ImageSuckr::GoogleSuckr.new
	  @movie_image = suckr.get_image_url({"q" => @movie_result.title})

	  erb :movieresults
	end
end

get "/stock" do 
	erb :stock
end 

get "/image" do 
	erb :image
end