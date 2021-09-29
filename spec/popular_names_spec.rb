require 'faraday'
require_relative '../popular_names'

describe PopularNames do
let(:client) { Faraday } 
let(:popular_names) { PopularNames.new(client).get }

	it 'resposta da url é 200',:vcr do
    expect(popular_names.status).to eq 200
	end

  it 'retorna os nomes',:vcr do
    expect(popular_names.body).to include 'MARIA' #resposta do objeto de classe ::operador de resolução de escopo
  end
end