require 'faraday'
require 'json'
class StatesNames

  def parse_success
    response = Faraday.get(url)
    estados = JSON.parse(response.body, symbolize_names: true)
    estados.map do |estado|
      estados = estado[:id], estado[:nome], estado[:sigla]
    end
  end

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
