require 'faraday'
require 'json'
class StatesNames

  def call
   response = Faraday.get(url)
   JSON.parse(response.body, symbolize_names: true)

  end


  #def estados_all
   # url.states = Json.parse(response.body, symbolize_names: true)
   # url.map do |estado|
   # estados =  estado[:id], estado[:sigla], estado[:nome]
   # end
  #end

  private

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
