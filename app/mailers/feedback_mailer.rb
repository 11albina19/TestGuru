class FeedbackMailer < ApplicationMailer
  def contact(user, feedback)
    @user = user
    @feedback = feedback

    mail to: Admin.first.email, subject: t(".subject")
  end
end
