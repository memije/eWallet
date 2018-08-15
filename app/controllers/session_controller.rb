class SessionController < ApplicationController

  def new
    render layout: "empty"
  end

  def create
    @customer = Customer.find_by("LOWER(email) = ?", login_params[:email].downcase)
    if @customer.present? && @customer.authenticate(login_params[:password])
      session[:customer_id] = @customer.id
      flash[:notice] = "Bienvenido de vuelta #{@customer.name}"
      redirect_to home_path
    else
      flash.now[:error] = "La combinacion de email y contraseña es incorrecta."
      render :new, layout: "empty"
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  private
  def login_params
    params.require(:session).permit(:email, :password)
  end
end
