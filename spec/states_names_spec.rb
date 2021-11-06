require 'faraday'
require_relative '../state_names'

describe StateNames do
  let(:states) { Faraday }
  let(:state_names) { StateNames.new(states).get }

  it 'resposta da url é 200', :vcr do
    expect(state_names.status).to eq 200
  end

  describe '#Retornar os estados' do
    context 'retorna a quantidade de estados' do
      let(:state_names) { StateNames.new(states).all_states }
      it 'retorna a quantidade de estados', :vcr do
        
        expect(state_names.all_states).to eq 26
      end
    end
  end
end
