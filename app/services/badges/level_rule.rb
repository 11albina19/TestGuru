module Badges
  class LevelRule
    class << self
      def check_the_rule(rule_name, result)
        user = result.user
        test_level = result.test.level 
      
        badge_in_level = Badge
          .where(rule_type: rule_name, parameter: test_level)

        if badge_in_level.exists? && result.successful?
          
          tests_in_level = Test
            .where(level: test_level)
            .pluck(:id)
          
          passed_tests_in_level = Result
            .where(user_id: user, test_id: tests_in_level)
            .select(&:successful?)
            .map(&:test_id)
            .uniq

          user.badges << badge_in_level if (tests_in_level - passed_tests_in_level).empty?
        end
      end
    end
  end
end
