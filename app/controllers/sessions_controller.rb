class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Вы успешно залогинились!'
    else
      flash.now.alert = 'Неправильно введен логин и/или пароль!'
      render :new
    end
  end

  def destroy
  end
end
