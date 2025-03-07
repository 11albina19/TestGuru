class GistQuestionService
  def initialize(question, client: GitHubClient.new)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    OpenStruct.new(success?: response[:html_url].present?, url: response[:html_url])
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end