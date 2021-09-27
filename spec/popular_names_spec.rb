require_relative '../popular_names'
require 'faraday'
describe PopularNames do
  
	it 'resposta da url é 200' do
		response = PopularNames.new.get #mudar o get
		expect(response).to eq 200
	end
end
