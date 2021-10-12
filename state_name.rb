require 'faraday'
attr_reader :state
class StateName

  def initialize
    @state = states #substantivos
  end
  
  def get_state(url)
    @state = state.get(url)
  end

  private
  def url#comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end