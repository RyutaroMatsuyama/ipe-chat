class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def login
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to select_path, notice: 'ログインしました'
    else
      redirect_to login_path, notice: 'ログインに失敗しました'
    end
  end

  def signup
  end

  def create
    user = User.new(create_params)
    if user.save
      session[:user_id] = user.id
      redirect_to select_path, notice: '登録しました'
    else
      redirect_to signup_path, notice: '登録に失敗しました'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  def select
    @users=User.all
  end

  def choose
    user = User.find_by(name: select_params[:name])
    if user
      session[:partner_id] = user.id
      redirect_to root_path, notice:'話す相手を選択しました'
    else
      redirect_to select_path, notice:'話す相手を選択できませんでした'
    end
  end


  private
  def login_params
    params.require(:session).permit(:email, :password)
  end

  def create_params
    params.require(:session).permit(:name, :email, :password, :password_confirmation)
  end

  def select_params
    params.require(:session).permit(:name)
  end
end
