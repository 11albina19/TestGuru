# frozen_string_literal: true

module ApplicationHelper

  def question_header(question)
    title = question.test.title
    if question.new_record?
      "Create New #{title} Question"
    else
      "Edit #{title} Question"
    end
  end

  def current_year
    Time.new.year
  end

  def github_url(author, repo)
    link_to 'Код проекта на github', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
