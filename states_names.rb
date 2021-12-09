class StatesNames
  attr_reader :states

  def initialize(states)
    @states = states
  end

  def get
    @states = states.get(url)
  end

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
