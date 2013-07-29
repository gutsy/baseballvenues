require 'sinatra'

$key= "7pmrmbkzzbwur9wzazsfsjmz"

ids = {
	'reds' => '17',
	'mariners' => '12',
	'cubs' => '16'
}

get '/venue/:team' do

	$id = ids[params[:team]]
	"Looking for the venue of the #{params[:team]}, which has id " + $id
end