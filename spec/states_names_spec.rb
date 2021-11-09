require 'faraday'
require_relative '../states_names'

describe StatesNames do
  let(:states_names) {StatesNames.new}
    it 'retorna o faraday',:vcr do
    hash = states_names.call
    expect(hash[0]).to include(nome:'Rondônia')
    end
end
