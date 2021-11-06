require 'faraday'
require_relative '../state_names'

describe StateNames do
  let(:state) { Faraday }
  let(:state_name) { StateNames.new(state).get }

    it 'resposta da url é 200', :vcr do
      expect(state_name.status).to eq 200
    end
end