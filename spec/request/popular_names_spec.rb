require 'faraday'
require_relative '../../app/request/popular_names'

describe PopularNames do
  context 'when the request status success ' do
    let(:names) { Faraday }
    let(:popular_names) {  PopularNames.new(names,'nome', 'rank', 'frequency').get } 

    it 'return code 200', :vcr do
      expect(popular_names.status).to eq 200
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
      let(:names) { Faraday }
      let(:parser_names) { PopularNames.new('names','nome', 'rank', 'frequency')}
      it 'return response body with values names', :vcr do
        expect(parser_names.nome).to eq('nome')
        expect(parser_names.rank).to eq('rank')
        expect(parser_names.frequency).to eq('frequency')
      end
    end
    context 'when method names_all is parseaded' do
      let(:nome) { Faraday }
      let(:keys_parsed) { PopularNames.new(nome(:nome),rank(:rank),frequency(:frequency)) }

      it 'return keys', :vcr do
        expect(keys_parsed.popular.nome).to eq ''
      end
    end
  end
end
