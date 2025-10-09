module Badges
  class LevelRule
    class << self
      def check_the_rule(rule_name, result)
        binding.pry
          #уровень: выбрать все бейджи, где правило - level, И уровень в параметре совпадает с уровнем теста
  badge_in_level = Badge.where(rule_type: :level, parameter: @result.test.level)

  @user.badges << badge_in_level if badge_in_level.any?
      end
    end
  end
end
