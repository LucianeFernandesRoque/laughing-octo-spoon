require 'faraday'
require_relative '../../app/request/popular_names'

describe PopularNames do
  context 'when the request status success ' do
    let(:response) do
      Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
    end
    let(:popular_names) { PopularNames.new('nome', 'rank', 'frequency') }

    it 'responds with 200', :vcr do
      expect(response.status).to eq(200)
    end
  end

  context 'when response api' do
    result = VCR.use_cassette(result) { PopularNames.names_all }
    it 'the include name maria' do
      expect(result[0]).to have_attributes(nome: 'MARIA', frequency: nil,
                                           rank: 1)
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
      result = VCR.use_cassette(result) { PopularNames.names_all }
      it 'return response body with values names' do
        expect(result.size).to eq(20)
        expect(result[0]).to have_attributes(nome: 'MARIA')
        expect(result[0]).to have_attributes(rank: 1)
        expect(result[0]).to have_attributes(frequency: nil)
      end
    end
  end
end
