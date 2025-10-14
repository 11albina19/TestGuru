module Badges
  class FirstTryRule
    class << self
      def check_the_rule(rule_name, result)
        user = result.user
        
        badge_first_try = Badge.where(rule_type: rule_name)
        if badge_first_try.exists? && result.successful? 
          user.badges << badge_first_try if Result.where(user_id: user, test_id: result.test).count == 1
        end 
      end
    end
  end
end
