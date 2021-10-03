require 'faraday'
class StateName
  def get#comportamento
    Faraday.get'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end