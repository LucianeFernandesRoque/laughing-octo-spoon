require 'faraday'
require 'json'
class StatesNames
  attr_reader :states

  def initialize(states)
    @states = states
  end

  def get
    @states = states.get(url)
  end

  private

  def url
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end

  def self.states_all
    response = get
    return {} unless response.status == 200

    json = JSON.parse(response_body, symbolize_names: true)[:data]

    json.map do |state|
      state = new(state_id: state[:id], uf: state[:sigla], nome: state[:nome])
    end
  end
end
