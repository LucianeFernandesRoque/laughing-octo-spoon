require 'pry'
class StatesNames
  attr_reader :states, :id, :sigla, :nome

  def initialize(states, id, sigla, nome)
    @states = states # substantivos
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def get
    @states = states.get(url)
  end

  def estados_all
    binding.pry
    url.states = Json.parse(response.body, symbolize_names: true)
    url.map do |_estado|
    estados =  estado[:id], estado[:sigla], estado[:nome]
    end
  end
  self.estados_all


  private

  def url # comportamento
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
  end
end
