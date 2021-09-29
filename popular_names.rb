class PopularNames
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def get
    @client = client.get(url)
  end

  private

  def url
    'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
  end
end
