module Badges
  class LevelRule
    class << self
      def check_the_rule(rule_name, result)
        user = result.user
        test_level = result.test.level 
        
        binding.pry
      
        badge_in_level = Badge.where(rule_type: rule_name, parameter: test_level)
        if badge_in_level.exists?
          user.badges << badge_in_level if badge_in_level.any?
        end
      end
    end
  end
end
