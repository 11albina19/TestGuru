module Badges
  class FirstTryRule
    class << self
      def check_the_rule(rule_name, result)
        binding.pry
        badge_first_try = Badge.where(rule_type: :first_try)
        #if @result.successful? && badge_first_try.exist?
      @user.badges << badge_first_try if Result.where(user_id: @user, test_id: @result.test).count == 1
        
      end
    end
  end
end
