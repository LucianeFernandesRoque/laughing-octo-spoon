require 'faraday'
require_relative '../../app/request/popular_names'

describe PopularNames do
  context 'when the request status success ' do
    let(:names) { Faraday }
    let(:popular_names) { PopularNames.new(names).get }

    it 'return code ok', :vcr do
      expect(popular_names.status).to eq 200
    end
  end

  context 'when the request failure' do
    before(:each) do
      response = {
        status: 'failure',
        data: []
      }
      stub_request(:get, 'https://servicodados.ibge.govxyz')
        .to_return(status: 404, body: response.to_json)
      it 'return failure code', :vcr do
        expect(popular_names.url.code).to eq '404'
      end
    end
  end
end
