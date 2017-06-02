class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"

  end

  def after_sign_in_path_for(resource)
    movies_path
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to user_login_path, notice: "Debe iniciar sesión primero."
    end
  end


end
