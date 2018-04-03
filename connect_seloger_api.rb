require "rest-client"
require 'nokogiri'

response = RestClient.get "http://ws.seloger.com/search.xml?tri=initial&idtypebien=1&pxmax=200000&idtt=2,5&naturebien=1,2,4&ci=780043"
document  = Nokogiri::XML(response)

puts ">>>>>>>>>>>>>>"

document.root.xpath('annonces').each do |annonce|
  annonce.xpath('annonce').each do |element|
    idAnnonce   = element.xpath('idAnnonce').text
    puts "annonce: #{idAnnonce}"
  end
end

puts "<<<<<<<<<<<<<<"
