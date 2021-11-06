require 'faraday'
require_relative '../state_names'

describe StateNames do
  let(:states) { Faraday }
  let(:state_names) { StateNames.new(states).get }

  it 'resposta da url é 200', :vcr do
    expect(state_names.status).to eq 200
  end
end
