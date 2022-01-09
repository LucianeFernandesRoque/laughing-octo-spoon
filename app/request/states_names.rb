require 'faraday'
require 'json'
class StatesNames
  attr_writer :states, :states_parse, :response, :url, :dados

  def initialize(states)
    @states = states
  end

  def response
    @states = Faraday.get(url)
  end

  def self.states_parse
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
      @dados = dados[:id], dados[:sigla], dados[:nome]
    end
  end

  def url
   'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end


end
