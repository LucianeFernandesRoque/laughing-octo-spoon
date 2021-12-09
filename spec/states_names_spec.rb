require 'faraday'
require_relative '../states_names'

describe StatesNames do
  # let(:states_names) { StatesNames.new(states) }

  context 'when the code is success' do
    let(:states) { Faraday }
    let(:states_names) { StatesNames.new(states).get }

    xit 'return o status', :vcr do
      expect(states_names.status).to eq 200
    end

    context 'when the code is request' do
      before(:each) do
        employees_response = {
          status: 'failled',
          data: []
        }
        stub_request(:get, 'https://servicodados.ibge.govxyz')
          .to_return(status: 404, body: employees_response.to_json)
      end
      it 'return o status', :vcr do
        expect(response.url.code).to eq '404'
      end
    end
  end

  xcontext '.parse_success' do
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
