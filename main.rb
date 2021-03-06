require "sinatra"
require "sinatra/reloader"
require "movies"
require "stock_quote"
require "image_suckr"
require "pry"


get "/" do
	erb :index
end

get "/movies" do
		erb :movies
end 

post "/movieresults" do
		@movie_result = Movies.find_by_title(params[:movie_name])

		if 
			@movie_result.title == nil 
			erb :movies

		else 	
	  suckr = ImageSuckr::GoogleSuckr.new
	  @movie_image = suckr.get_image_url({"q" => "#{@movie_result.title}"})
	  
	  erb :movieresults
		end
end

get "/stock" do 
	erb :stock
end 

post "/stock_detail" do
	begin
		@stock_result = StockQuote::Stock.quote(params[:stock_symbol])
		erb :stock_detail
	rescue
		erb :stock
	end

end 

get "/image" do 
	erb :image
end

post "/imageresults" do
 	suckr = ImageSuckr::GoogleSuckr.new
 	@imagesearch = suckr.get_image_url({"q" => params[:image_name]})
	erb :imageresults 
end

get "/imagerandom" do
	random_words = ["whitetrash", "golf", "text", "phone", "walrus", "kleenex", "roof", "gum", "seven", "california", "happy", "note", "ocean", "pink", "girl", "boy", "asian", "pool"]
	suckr = ImageSuckr::GoogleSuckr.new
	@image_random_search = suckr.get_image_url({"q" =>random_words.sample})
	erb :imagerandom
end 