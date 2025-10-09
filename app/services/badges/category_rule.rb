module Badges
  class CategoryRule
    class << self
      def check_the_rule(rule_name, result)
          #категория: 1. выбрать 1 бейдж, где правило - category И категория 
  #в параметре совпадает с категорией пройденного теста
  #получим 1 бейдж или несколько? по идее, 1, несколько таких нет смысла создавать
  badge_in_category = Badge.where(rule_type: :category, parameter: @result.test.category.title)

  #!!!!!!!ЕСЛИ ТАКОЙ БЭЙДЖ ЕСТЬ!!!!!! проверка, прошел ли пользователь ВСЕ тесты в этой категории
  tests_in_category = Test.where(category_id: @result.test.category)
  passed_tests_in_category = Result.where(user_id: @user, test_id: tests_in_category)
 
  @user.badges << badge_in_category if (tests_in_category - passed_tests_in_category).empty?
      end
    end
  end
end
