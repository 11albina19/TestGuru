module ResultsHelper

  def success_rate(result)
    100 / result.test.questions.count * result.correct_question
  end

  def return_color(result)
    if success_rate(result) >= 85
      'text-success'
    else
      'text-fail'
    end
  end

  def return_message(result)
    if success_rate(result) >= 85
      'Тест успешно пройден'
    else
      'Тест не пройден'
    end
  end
end
