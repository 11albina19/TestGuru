class Test < ApplicationRecord

  def self.sort_name (category)
    array = Test.where(category_id: category.id).pluck(:title)
    array.sort! {|a,b| b <=> a}
    array
  end


end
