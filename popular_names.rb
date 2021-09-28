require 'faraday'
class PopularNames
	def get
		response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/')
	end
end