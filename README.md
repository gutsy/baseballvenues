baseballvenues
==============

A simple ruby app written using Sinatra (just to see what it can do).

Will call the ESPN api and pull the venue of the team requested. 

Requires installation of Sinatra of JSON:

gem install sinatra
gem install json

Then edit the ruby script to add your ESPN API key

THEN, finally, run the app from the command line like so: ruby venues.rb 

That starts up Sinatra on port 4567. Go to localhost:4567/venues/<team name>

The only three that work at the moment are reds, cubs and mariners.

ESPN's API documentation isn't the best and the only way to find the team codes is by looking at a big ugly JSON string. 

So, what is the point of this? NOTHING. Absolutely nothing. I just wanted to play with Ruby a little bit and thought Sinatra sounded more interesting than Rails. 

Enjoy.


