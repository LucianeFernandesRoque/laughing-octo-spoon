require 'faraday'
require_relative '../states_names'

describe StatesNames do
  let(:states) { Faraday }
  let(:states_names) { StatesNames.new(states,'id','nome','sigla').get }


  it 'resposta da url é 200', :vcr do
    expect(states_names.status).to eq 200
  end

  context '#estados_all' do
    it 'verifica a quantidade de estados', :vcr do
        states_names.estados_all
        binding.pry
      expect(states_names.estados_all).to eq []
    end
  end
end
