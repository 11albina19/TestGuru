class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tests_path
    else
      flash.now[:alert] = "Почта не корректна"
      render turbo_stream: turbo_stream.replace(
        'flash-messages',
        partial: 'layouts/flash',
        locals: { flash: flash }
      )
    end
  end

  def user_params
    params.require(:user).permit(:mail, :password, :password_confirmation)
  end
end
