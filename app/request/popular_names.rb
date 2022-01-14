require 'faraday'
require 'json'
class PopularNames
  attr_reader :nome, :rank, :frequency

  def initialize(nome, rank, frequency)
    @nome = nome
    @rank = rank
    @frequency = frequency
  end

  def self.names_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
    json = JSON.parse(response.body, symbolize_names: true)
    item = json.map do |item|
      result = new(item[:nome], item[:rank], item[:frequency])
    end
  end
end
