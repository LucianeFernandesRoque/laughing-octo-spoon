require 'pry'
class StateNames
  attr_reader :states
  def initialize(states)
    @states = states # substantivos
  end

  def get
    @states = states.get(url)
  end

  private

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
