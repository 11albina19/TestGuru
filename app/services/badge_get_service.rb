class BadgeGetService

  RULES = {
    category: 
    first_try:
    level:
  }

  def initialize(result)
    @result = result
    @user = result.user
  end

  def call
    binding.pry
  end
end
