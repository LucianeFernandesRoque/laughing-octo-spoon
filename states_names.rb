require 'faraday'
class StatesNames
  attr_reader :states, :states_parse, :response, :get

  def initialize(states)
    @states = states
  end

  def get
    @states = states.get(response)
  end

  def states_parse
    json = JSON.parse { response.body symbolize_names: true }
    response = json.map do |state|
      states = state[:id], state[:sigla], state[:nome]
    end
  end

  def response
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
