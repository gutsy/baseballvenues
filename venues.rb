require 'sinatra'
require 'net/http'
require 'json'

$key= "7pmrmbkzzbwur9wzazsfsjmz"

ids = {
	'reds' => '17',
	'mariners' => '12',
	'cubs' => '16'
}

get '/venue/:team' do

	id = ids[params[:team]]
	url = 'http://api.espn.com/v1/sports/baseball/mlb/teams/' + id + '?enable=venues&apikey=' + $key
	resp = Net::HTTP.get_response(URI.parse(url))
	data = resp.body
	parsed = JSON.parse(data)

	#venue parsed["sports"]["venues"]
	"Looking for the venue of the #{params[:team]}, which has id " + id + ", and here's the data returned: " + data

end