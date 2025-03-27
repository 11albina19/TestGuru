class GistQuestionService
  NewGistResult = Struct.new(:success?, :url)

  def initialize(question, current_user, client = default_client)
    @question = question
    @user = current_user
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    if @client.last_response.status == 201
      Gist.create!(
        user: @user,
        question: @question,
        url: response.html_url
      )
      NewGistResult.new(true, response.html_url)
    else
      NewGistResult.new(false, nil)
    end
  end

  private

  def default_client
    token = ENV.fetch('GITHUB_ACCESS_TOKEN') { raise t('services.gist_question_service.no_token') }
    Octokit::Client.new(access_token: token)
  end

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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
