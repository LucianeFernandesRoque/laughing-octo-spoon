require 'faraday'
require_relative '../../app/request/states_names'

describe 'StatesNames' do
  context 'when the request status success' do
    let(:response) do
      Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados')
    end
    let(:states_names) { StatesNames.new('id', 'sigla' , 'nome') }

    it 'responds with 200', :vcr do
      expect(response.status).to eq(200)
    end
  end

    context 'when response api names' do
      result = VCR.use_cassette(result) { StatesNames.states_all }
      it 'must to include SP' do
        expect(result[0]).to have_attributes(id: '11', sigla: "RO", nome: "Rondônia")
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
