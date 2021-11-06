require 'pry'
class StateNames
  attr_reader :states, :parse_estados

  def initialize(states)
    @states = states # substantivos
    @parse_estados = []
  end

  def get
    @states = states.get(url)
  end

  def all_states
    @parse_estados = @states
  end

  private

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
