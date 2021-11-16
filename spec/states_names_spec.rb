require 'faraday'
require_relative '../states_names'

describe StatesNames do
  context '.call' do
    let(:states_names) { StatesNames.new }
    it 'retorna o faraday', :vcr do
      hash = states_names.call
      expect(hash[0]).to include(id: 11)
      expect(hash[0]).to include(nome: 'Rondônia')
      expect(hash[0]).to include(sigla: "RO")
    end
  end
end
