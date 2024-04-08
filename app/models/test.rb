class Test < ApplicationRecord

  def self.sort_tests_selection_category(category_name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: { title: category_name }).order('tests.title DESC').pluck('tests.title')
  end
end
