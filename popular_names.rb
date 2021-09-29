require 'faraday'
class PopularNames
	attr_reader :client # boa

	def initialize(client)
		@client = client
	end

	def get #construo =>objetivo: mostrar o que meu método faz, exemplo faz um get em uma determinada url
		@client = client.get(url)
	end

	private

	def url
		'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
	end
end