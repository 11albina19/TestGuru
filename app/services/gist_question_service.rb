class GistQuestionService
  def initialize(question, current_user, client: nil)
    @question = question
    @user = current_user
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def call
    response = @client.create_gist(gist_params)
    return unless success?
    Gist.create!(
      user: @user,
      question: @question,
      url: response.html_url
    )
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t("services.gist_question_service.message", code: @test.title),
    files: {
      'test-guru-question.txt' => {
        content: gist_content
      }
    }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end