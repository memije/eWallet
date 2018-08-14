class ApplicationController < ActionController::Base

    helper_method :customer_signed_in?, :current_customer

    protected

    def authenticate_customer
        if current_customer.blank?
            session.delete(:customer_id)
            redirect_to(session_new_path)
        end
    end

    def current_customer
        @current_customer ||= Customer.find_by(id: session[:customer_id])
    end

    def customer_signed_in?
        current_customer.present?
    end
end
