require 'faraday'
require_relative '../../app/request/states_names'
require 'vcr'

describe 'StatesNames' do
  context 'when the request status success' do
    let(:response) do
      Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados')
    end
    let(:state) do
      VCR.use_cassette('state') do
        StatesNames.new(:id, :sigla, :nome)
      end
    end

    it 'responds with 200', :vcr do
      expect(response.status).to eq(200)
    end
  end

  context 'when response api names' do
    let(:result_all) do
      VCR.use_cassette('result_all') do
        StatesNames.states_all
      end
    end
    it 'must the array iunclude states' do
      expect(result_all.length).to eq(27)
      expect(result_all[0].id).to eq(11)
      expect(result_all[0].sigla).to eq 'RO'
      expect(result_all[0].nome).to eq 'Rondônia'
      expect(result_all[6].id).to eq(17)
    end
  end

  context 'when failled' do
    before(:each) do
      response = {
        status: 'failled'

      }
      stub_request(:get, 'https://servicodados.ibge.govxyz')
        .to_return(status: 404, body: response.to_json)
      it 'return o status' do
        expect(response.url.code).to eq '404'
      end
    end
  end
end
