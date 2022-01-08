require 'faraday'
require_relative '../../popular_names'

describe PopularNames do
  context 'when the request status ' do
    let(:client) { Faraday }
    let(:popular_names) { PopularNames.new(client).get }

    it 'resposta da url é 200', :vcr do
      expect(popular_names.status).to eq 200
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
        expect(popular_names.url.code).to eq '404'
      end
    end
  end
end
