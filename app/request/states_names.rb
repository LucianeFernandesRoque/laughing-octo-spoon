require 'faraday'
require 'json'
class StatesNames
  attr_reader :id, :sigla, :nome

  def initialize(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.states_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados')
    json = JSON.parse(response.body, symbolize_names: true)
    items = json.map do |item|
      result = new(item[:id], item[:sigla], item[:nome])
    end
  end
end
