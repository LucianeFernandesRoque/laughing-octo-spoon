require 'faraday'
require_relative '../popular_names'

describe PopularNames do
  context 'when the request status ' do
    let(:client) { Faraday }
    let(:popular_names) { PopularNames.new(client).get }

    it 'resposta da url é 200', :vcr do
      expect(popular_names.status).to eq 200
    end
    context 'when the request status failled' do
      it 'resposta da url é 400', :vcr do
        expect(popular_names.status)
      end
    end
  end

  context 'when the return names' do
    let(:client) { Faraday }
    let(:popular_names) { PopularNames.new(client).get }
    it 'retorna os nomes', :vcr do
      expect(popular_names.body).to include 'MARIA'
    end
  end
end
