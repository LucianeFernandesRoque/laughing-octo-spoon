require 'faraday'
require_relative '../../app/request/states_names'

describe 'StatesNames' do
  context 'when the request status success' do
    let(:states) { Faraday }
    let(:states_names) { StatesNames.new(states).get }

    it 'response with code 200', :vcr do
      expect(states_names.status).to eq 200
    end
    context 'when response api names' do
      it 'must to include SP', :vcr do
        expect(states_names.body).to include 'SP'
      end
    end
  end

  context 'when failled' do
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
end
