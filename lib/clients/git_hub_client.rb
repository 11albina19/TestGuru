class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    response = @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ENV.fetch('GITHUB_ACCESS_TOKEN')}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end

    parse_response(response)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT) do |faraday|
      faraday.request :json
      faraday.response :json, parser_options: { symbolize_names: true }
      faraday.adapter Faraday.default_adapter
    end
  end

  def parse_response(response)
    return response.body if response.success?

    { error: response.status }
  end
end