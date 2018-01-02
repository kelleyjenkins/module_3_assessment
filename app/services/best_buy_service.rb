class BestBuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def all_by_zipcode(zip)
    get_json("/v1/stores(area(80203,25))?format=json&show=storeType,name,city,distance,phone&pageSize=25&apiKey=ru99w3xp6qu5848qvbgrznxq")[:stores]
  end

  def get_json(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end