require 'nokogiri'
require 'open-uri'

#1 Collecte de toutes les URLs des villes du Val d'Oise
def get_townhall_urls

  # Scrapping de toutes les URLs
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
	urls = page.xpath('//*[@class="lientxt"]/@href') # toutes les URLs appartiennent à la classe lientxt

  #stockage des URLs scrappées dans une array
	url_array = []
  urls.each do |url| # pour chaque URLs récupérées, il faut leur indiquer l'url parent "http://annuaire-des-mairies.com"
		url = "http://annuaire-des-mairies.com" + url.text[1..-1] # A l'url parent, on ajoute les urls récupérées du deuxième caractère au dernier caractère, car on veut se débarasser du point devant.
		url_array << url
  end

  puts " ⏳ URLs scrapping in process...3️, 2️, 1️" 
  sleep 3
  puts "⭐⭐⭐ BINGOOOOOO ⭐⭐⭐" #https://emojipedia.org/
  sleep 1
  return url_array 
end

#2 Methode pour collecter l'email d'une contenu dans une URL d'une mairie d'une ville du Val d'Oise
def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(URI.open(townhall_url)) # on indique une variable renvoyant aux URLs qui sera utilisée dans la méthode finale
	email_array = []

	email = page.xpath('//*[contains(text(), "@")]').text
	email_array << email
	
  p email_array[0] # https://stackoverflow.com/questions/15784503/ruby-method-to-print-and-neat-an-array
	return email_array
end
# pour tester faire par exemple >>> get_townhall_email("https://www.annuaire-des-mairies.com/95/ableiges.html")

#3 Synchronisation des noms des villes et des emails des mairies
def get_all_email
	url_array = get_townhall_urls #définir une array équivalente au résultat de la méthode qui a permis de créer l'array
	url_array.each do |townhall_url| 
		get_townhall_email(townhall_url) # pour chaque URL d'une ville du Val d'Oise, on associe l'adresse mail de la mairie via la méthode get_townhall_email
	end
end 
get_all_email()