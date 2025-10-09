module Badges
  class CategoryRule
    class << self
      def check_the_rule(rule_name, result)
        user = result.user
        category_title = result.test.category.title
        
        badge_in_category = Badge.where(rule_type: rule_name, parameter: category_title)
        if badge_in_category.exists?
          tests_in_category = Test.where(category_id: result.test.category)
          passed_tests_in_category = Result.where(user_id: user, test_id: tests_in_category)
 
          user.badges << badge_in_category if (tests_in_category - passed_tests_in_category).empty?
        end

        #binding.pry
      end
    end
  end
end
