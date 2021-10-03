require_relative '../state_name'
require 'faraday'
describe StateName do
    it 'resposta da url é 200', :vcr do
       states = StateName.new.get
      expect(states.status).to eq 200
    end
end