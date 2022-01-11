require 'faraday'
require 'json'
require 'vcr'
class PopularNames
  attr_reader  :nome, :rank, :frequency

  def initialize(nome, rank, frequency)
    @nome = nome
    @rank = rank
    @frequency = frequency
  end


  def self.names_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
    json = JSON.parse(response.body, symbolize_names: true)
    result = json.map do |item|
      item = new( item[:nome], item[:rank], item[:frequency] )
    end
  end
end
