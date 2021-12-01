require 'faraday'
require_relative '../states_names'

describe StatesNames do
  context '.call' do
    let(:states_names) { StatesNames.new }
    it 'retorna o faraday', :vcr do
      estado = states_names.parse
      expect(estado.last).to eq('53, "Distrito Federal", "DF"')
    end
  end
end
