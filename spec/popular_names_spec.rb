require_relative '../popular_names'
describe PopularNames do 
	it 'resposta da url é 200',:vcr do
		response = PopularNames.new.get #mudar o get
		expect(response.status).to eq 200
	end

  it 'retorna os nomes', :vcr do
    response = PopularNames.new.get
    expect(response.body).to include 'MARIA' #resposta do objeto de classe ::operador de resolução de escopo
  end
end
