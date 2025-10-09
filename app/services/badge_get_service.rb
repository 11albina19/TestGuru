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
    RULES.each do |rule, rule_class|
      rule_class.check_the_rule(rule, @result)
    end
  end
end
