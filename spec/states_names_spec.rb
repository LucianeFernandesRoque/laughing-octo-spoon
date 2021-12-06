require 'faraday'
require_relative '../states_names'

describe StatesNames do
  context '.parse' do
    context 'when the api return states' do
      let(:states_names) { StatesNames.new }
      it 'retorna o faraday', :vcr do
        estado = states_names.parse
        expect(estado.length).to eq(27)
        expect(estado.first).to eq([11, 'Rondônia', 'RO'])
        expect(estado.last).to eq([53, 'Distrito Federal', 'DF'])
      end
    end
  end
end
