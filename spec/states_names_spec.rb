require 'faraday'
require_relative '../states_names'

describe StatesNames do
  context '.call' do
    let(:states_names) { StatesNames.new }
    it 'retorna o faraday', :vcr do
      estado = states_names.parse
      expect(estado.length).to eq(27)
    end
  end
end
