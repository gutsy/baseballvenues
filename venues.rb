require 'sinatra'
require 'rubygems'
require 'net/http'
require 'json'

$key= ""

ids = {
	'reds' => '17',
	'mariners' => '12',
	'cubs' => '16'
}

get '/venue/:team' do

	#find the id from the team string. Only 3 work at the moment
	id = ids[params[:team]]
	url = 'http://api.espn.com/v1/sports/baseball/mlb/teams/' + id + '?enable=venues&apikey=' + $key
	#call ESPN and demand the data. DEMAND IT
	resp = Net::HTTP.get_response(URI.parse(url))
	data = resp.body
	json = JSON.parse data

	#then iterate through the JSON to get the venue name
	venues = json["sports"].first["leagues"]
              .first["teams"]
              .each_with_object([]){|h,xs|
                venues = h["venues"].map{|h| h["name"]}.join(", ")
                xs << "#{venues}"
              }

    #this is probably an ugly java-style hack to cut off the array formatting, but oh well
    venue = venues.to_s
    venue.gsub!("[\"", "")
    venue.gsub!("\"]", "")

    #have Sinatra print it
    "The #{params[:team]} play in " + venue.to_s

end
