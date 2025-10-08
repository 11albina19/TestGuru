class BadgeGetService

  RULES = {
    category: ::Badges::CategoryRule,
    first_try: ::Badges::CategoryRule,
    level: ::Badges::CategoryRule
  }.freeze

  def initialize(result)
    @result = result
    @user = result.user
  end

  def call
  badge_array = []
  #категория: 1. выбрать 1 бейдж, где правило - category И категория 
  #в параметре совпадает с категорией пройденного теста
  #получим 1 бейдж или несколько? по идее, 1, несколько таких нет смысла создавать
  badge_in_category = Badge.where(rule_type: :category, parameter: @result.test.category.title)

  #!!!!!!!ЕСЛИ ТАКОЙ БЭЙДЖ ЕСТЬ!!!!!! проверка, прошел ли пользователь ВСЕ тесты в этой категории
  tests_in_category = Test.where(category_id: @result.test.category)
  passed_tests = Result.where(user_id: @user, test_id: tests_in_category)
  passed_all = (tests_in_category - passed_tests).empty?
  badge_array << badge_in_category if passed_all
  #первая попытка: выбрать все бейджи, где правило - first_try, тут параметр видимо пустой
  #но тут нужно сначала удостовериться, что тест пройден с 1 попытки
  
  #уровень: выбрать все бейджи, где правило - level, И уровень в параметре совпадает с уровнем теста
  binding.pry 
  end
end
