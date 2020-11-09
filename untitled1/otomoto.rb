
require 'open-uri'
require 'nokogiri'
require 'csv'

class Otomoto
  attr_accessor :nokogiri_doc ,:auta
  def initialize(html)
    @html = html
  end

  def pobierz_auta
    strona = open("#{@html}").read
    @nokogiri_doc = Nokogiri::HTML(strona)
    @auta = []
    10.times do
   @nokogiri_doc.search("article.offer-item").each do |offerta|
     samochod = {}
     samochod[:auto] = offerta.css("a.offer-title__link").text.gsub("\n", "").gsub("\s", "")
     samochod[:rok] = offerta.css("ul.ds-params-block li[data-code='year']").text.gsub("\n", "").gsub("\s", "")
     samochod[:przebieg] = offerta.css("ul.ds-params-block li[data-code='mileage']").text.gsub("\n", "").gsub("\s", "")
     samochod[:pojemnosc] = offerta.css("ul.ds-params-block li[data-code='engine_capacity']").text.gsub("\n", "").gsub("\s", "")
     samochod[:typ] = offerta.css("ul.ds-params-block li[data-code='fuel_type']").text.gsub("\n", "").gsub("\s", "")
     @auta << samochod
   end
   @html =  @nokogiri_doc.css("div.row ul.om-pager li a")[0]['href']
   strona = open("#{@html}").read
   @nokogiri_doc = Nokogiri::HTML(strona)



    end
   end
  def zapisz
    filepath ="test.csv"
    csv_options = {headers: :first_row, col_sep: ','}
    CSV.open(filepath, 'wb', csv_options) do |csv|
      @auta.each_with_index do |x|
        csv <<[x[:auto],x[:rok],x[:przebieg],x[:pojemnosc],x[:typ]]
      end
      end
  end
end
strona = Otomoto.new("https://www.otomoto.pl/osobowe/opel/")
strona.pobierz_auta
strona.zapisz

