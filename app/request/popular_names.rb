require 'faraday'
require 'json'
class PopularNames
  attr_reader :names, :nome, :rank, :frequency

  def initialize(names, nome, rank, frequency)
    @names = names
    @nome = nome
    @rank = rank
    @frequency = frequency 
  end

  def get
    @names = names.get(url)
  end


  def url
    'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
  end

  def names_all
    response = names.get(url)
    return {} unless response.status == 200

    json = JSON.parse(response.body, symbolize_names: true)

    json.map do |popular|
      popular = popular[:nome],popular[:rank],popular[:frequency]
    end
   puts popular
  end
end
