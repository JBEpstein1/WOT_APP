class DataFetcherService
  def self.fetch_data(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
