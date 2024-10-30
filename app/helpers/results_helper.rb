module ResultsHelper

  def return_color(result)
    if result.successful?
      'text-success'
    else
      'text-fail'
    end
  end

  def return_message(result)
    if result.successful?
      'Тест успешно пройден'
    else
      'Тест не пройден'
    end
  end
end
