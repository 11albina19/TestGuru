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
      t('helpers.results.successfully')
    else
      t('helpers.results.failed')
    end
  end
end
