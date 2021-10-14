require 'nokogiri'
require 'open-uri'

def dark_trader
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  #1 création array avec les noms des monnaies
  puts "Step 1. Crypto names collection..."
  crypto_name_array = [] # initialisation d'un array vide pour stocker les éléments recherchés
  xpath_names = page.xpath('//*[contains(text(), "bitcoin")]')  # sélectionner les éléments à stocker à l'array via inspect / XPath directement sur la page web
  xpath_names.each { |crypto_name| crypto_name_array << crypto_name.text } #stocker chaque élément à l'array en le convertissant en format text

  #2 création array avec les valeurs des monnaies
  puts "Step 2. Crypto values collection..."
  crypto_value_array = []
  xpath_values = page.xpath('//*[contains(text(), ".")]')
  xpath_values.each { |crypto_value| crypto_value_array << crypto_value.text[1..-1].to_f } #convertir le texte au format demandé : en float et sans le $ au début (autre possibilité : .delete("$"))
  
  #3 réconciliation des arrays sous forme de hashes dans un array
  result = []
  crypto_name_array.each_with_index { |k,v| result << {k => crypto_value_array[v] } }

  puts "Step 3. Final result :" 
  return result
end

p dark_trader
