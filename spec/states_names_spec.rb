require 'faraday'
require_relative '../states_names'
require 'vcr'

describe StatesNames do
  context 'when the code is success' do
    let(:states_faraday) { Faraday }
    let(:states_names) { StatesNames.new(states_faraday) }
    it 'return o status', :vcr do
      expect(states_faraday.status).to eq(200)
    end
  end
  context 'when the code is request' do
    before(:each) do
      response = {
        status: 'failled',
        data: []
      }
      stub_request(:get, 'https://servicodados.ibge.govxyz')
        .to_return(status: 404, body: response.to_json)
      it 'return o status', :vcr do
        expect(estado.url.code).to eq '404'
      end
    end
  end

  context '.parse_success' do
    let(:states_faraday) { Faraday }
    let(:estado) { StatesNames.new(states_faraday).get }
    context 'when the api return states' do
      it 'return states',:vcr do
        expect(estado.states_parse).to eq(27)
        expect(estado.first).to eq([11, 'Rondônia', 'RO'])
        expect(estado.last).to eq([53, 'Distrito Federal', 'DF'])
      end
    end
  end
end
