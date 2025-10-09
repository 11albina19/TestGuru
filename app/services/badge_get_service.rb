class BadgeGetService

  RULES = {
    category: ::Badges::CategoryRule,
    first_try: ::Badges::FirstTryRule,
    level: ::Badges::LevelRule
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
  #ПРАВИЛО 1
  #поправить
  
  #ПРАВИЛО 2
  #поправить
  
  #ПРАВИЛО 3
  #поправить
    RULES.each do |key, value|
      value.check_the_rule(key, @result)
    end
  end
end
