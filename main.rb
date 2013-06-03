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
	  @movie_image = suckr.get_image_url({"q" => "#{@movie_result.title}"})
	  
	  erb :movieresults
end

get "/stock" do 
	erb :stock
end 

get "/stock_detail" do
	@stock_result = StockQuote::Stock.quote(params[:stock_symbol])
	erb :stock_detail
end 

get "/image" do 
	erb :image
end

get "/imageresults" do
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