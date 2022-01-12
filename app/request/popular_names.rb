require 'faraday'
require 'json'
class PopularNames
  attr_reader :nome, :rank, :frequency

  def initialize(nome, rank, frequency)
    @nome = nome
    @rank = rank
    @frequency = frequency
  end

  def get
    nomes.get(url)
  end

  def self.names_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
    json = JSON.parse(response.body, symbolize_names: true)
    result = json.map do |item|
      item = new(item[:nome], item[:rank], item[:frequency])
    end
  end

  def url
    
  end
end
