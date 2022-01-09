class PopularNames
  attr_reader :names

  def initialize(names)
    @names = names
  end

  def get
    @names = names.get(url)
  end

  private

  def url
    'https://servicodados.ibge.gov.br/api/v2/censos/nomes/'
  end
end
