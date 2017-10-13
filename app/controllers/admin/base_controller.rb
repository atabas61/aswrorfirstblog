class Admin::BaseController < ApplicationController
  layout 'login', only: [:login, :do_login]
  layout 'admin', except: [:login, :do_login]
    
  before_action :admin_login_control, except: [:login, :do_login]
  before_action :admin_login_login_control, only: [:login, :do_login]
  def index
  end
    
    
  def login
      
      
  end
    
  def do_login
      data = params.require(:user).permit(:username, :password)
      username = data[:username]
      password = Digest::MD5.hexdigest(data[:password])
      
      user = User.where(username: username, password: password).take
      
      if user
          session[:status] = true
          session[:level] = user.status
          session[:user_id] = user.id
          redirect_to admin_root_path
      else
          redirect_to admin_login_path, notice: 'Bir hata oluştu tekrar deneyin.'
      end
  end
    
  def logout
    if session[:status]==true
        reset_session
    end
      redirect_to admin_root_path
  end
    
    
  def admin_login_control
    if session[:status]!=true || session[:level]!=3
        redirect_to admin_login_path
    end
  end
    
  def admin_login_login_control
      if session[:status]==true && session[:level]==3
        redirect_to admin_root_path
    end
  end
end
