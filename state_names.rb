class StateNames
  attr_reader :state

  def initialize(state)
    @state = state #substantivos
  end
  
  def get
    @state = state.get(url)
  end

  private

  def url#comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end