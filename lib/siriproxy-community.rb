# -*- encoding : utf-8 -*-
require 'cora'
require 'siri_objects'
require 'pp'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This 
# is good base code for other plugins.
# 
# Remember to add other plugins to the "config.yml" file if you create them!
######

#Note about returns from filters:
# - Return false to stop the object from being forwarded
# - Return a Hash to substitute or update the object
# - Return nil (or anything not a Hash or false) to have the object forwarded (along with any 
#    modifications made to it)

class SiriProxy::Plugin::Example < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  #get the user's location and display it in the logs
  #filters are still in their early stages. Their interface may be modified
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"       
  end 
    
  #Essential for server status
  listen_for /Leck mich am Arsch/i do
    say "Das kannst du vergessen"
    say "Damit du dann einen sauberen Hintern hast und ich Sodbrennen?"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  listen_for /Bloede Kuh/i do
    say "Aha , gut zu wissen?"
    say "In Zukunft kannst du dir deine Bloeden fragen da hin stecken wo keine Sonne hin scheint?"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
    
  
  listen_for /Ich will Sex von dir/i do
    say "Aha, du willst sex mit mir?"
    say "Also mal Ehrlich , mit deinem 5 milimeter Sportbrunser kommste bei mir nicht an."
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
	
	
  listen_for /Erzähle mir einen Witz/i do
    say "Ich versuche mein Bestes aber ich bin nicht gerade gut darin. "
    say "Fritzchen kommt ins Schlafzimmer und sieht, wie Mami stoehnend auf Papa reitet. Was macht ihr denn da?"
	say "Mama antwortet: Ich massiere Papa gerade den Bauch weg!"
	say "Meint Fritzchen: Das bringt doch nichts! Jeden Donnerstag kommt die Nachbarin und blaest ihn wieder auf!"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
 end
 

 listen_for /Ich will Sex von dir/i do
    say "Aha, du willst sex mit mir?"
    say "Also mal Ehrlich , mit deinem 5 milimeter Sportbrunser kommste bei mir nicht an."
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
end




