require 'faraday'
require_relative '../states_names'

describe StatesNames do
  let(:states_names) { StatesNames.new }

  context 'when the code is success' do
    let(:response) { Faraday.get }
    let(:url_request) { StatesNames.new.url }

    it 'return o status', :vcr do
      expect(response.url.code).to eq 200
    end

    context 'when the code is request' do
      it 'return o status', :vcr do
        expect(response.url.code).to eq '404'
      end
    end
  end

  context '.parse_success' do
    let(:estado) { states_names.parse_success }
    context 'when the api return states' do
      it 'return all states', :vcr do
        expect(estado.length).to eq(27)
        expect(estado.first).to eq([11, 'Rondônia', 'RO'])
        expect(estado.last).to eq([53, 'Distrito Federal', 'DF'])
      end
    end

    xcontext 'its return only id states' do
      let(:estado_ids) { states_names.parse_success.estadop }
      it 'return all ids' do
        states_names
        expect(estado_ids.all).to eq(1)
      end
    end
  end
end
