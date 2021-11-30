require 'faraday'
require 'json'
class StatesNames

  def call
   response = Faraday.get(url)
   JSON.parse(response.body, symbolize_names: true)
  end

  private

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end