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
  #ПРАВИЛО 1
  #категория: 1. выбрать 1 бейдж, где правило - category И категория 
  #в параметре совпадает с категорией пройденного теста
  #получим 1 бейдж или несколько? по идее, 1, несколько таких нет смысла создавать
  badge_in_category = Badge.where(rule_type: :category, parameter: @result.test.category.title)

  #!!!!!!!ЕСЛИ ТАКОЙ БЭЙДЖ ЕСТЬ!!!!!! проверка, прошел ли пользователь ВСЕ тесты в этой категории
  tests_in_category = Test.where(category_id: @result.test.category)
  passed_tests_in_category = Result.where(user_id: @user, test_id: tests_in_category)
 
  @user.badges << badge_in_category if (tests_in_category - passed_tests_in_category).empty?
  
  #ПРАВИЛО 2
  #первая попытка: выбрать все бейджи, где правило - first_try, тут параметр видимо пустой
  badge_first_try = Badge.where(rule_type: :first_try)
  #!!!!!!!ЕСЛИ ТАКОЙ БЭЙДЖ ЕСТЬ!!!!!! тут нужно сначала удостовериться, что тест пройден с 1 попытки
  #стоп, еще надо убедиться, что не просто пройден, а правильно пройден
  
  @user.badges << badge_first_try if Result.where(user_id: @user, test_id: @result.test).count == 1
    
  #ПРАВИЛО 3
  #уровень: выбрать все бейджи, где правило - level, И уровень в параметре совпадает с уровнем теста
  badge_in_level = Badge.where(rule_type: :level, parameter: @result.test.level)

  @user.badges << badge_in_level if badge_in_level.any?
 
  binding.pry 
  end
end
