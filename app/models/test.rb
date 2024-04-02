class Test < ApplicationRecord
  belongs_to :category

  def self.sort_tests_selection_category(category_name)
    Category.where(title: category_name).joins(:tests).order('tests.title DESC').pluck('tests.title')
  end
end
