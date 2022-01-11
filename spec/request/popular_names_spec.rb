require 'faraday'
require_relative '../../app/request/popular_names'

describe PopularNames do
  context 'when the request status success ' do
    it 'return code 200', :vcr do
      result = VCR.use_cassette(result) { PopularNames.names_all }

      expect(result).to eq 200
    end
    context 'when response api' do
      it 'the include name maria', :vcr do
        expect(popular_names.body).to include('MARIA')
      end
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

  describe '#parsernames' do
    context 'is success' do
      it 'return response body with values names', :vcr do
        result = VCR.use_cassette(result) { PopularNames.names_all }
        expect(result.length).to eq(20)
        expect(nome).to eq('@nome MARIA')
        expect(result.frequency).to eq()
      end
    end
  end
end
