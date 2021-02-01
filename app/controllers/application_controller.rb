class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_paremeters, if: :devise_controller?
    before_action :configuraciones
    before_action :set_shopping_cart

    protected

    def configure_permitted_paremeters
        attributes = [:name, :age, :state, :city,:email,:password,:password_confirmation]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

    rescue_from CanCan::AccessDenied do |exception|
        if user_signed_in?
            redirect_to root_path, alert: "#{exception.message}"
        else
            redirect_to new_user_session_path, alert: "Acceso denegado: #{exception.message}"
        end
    end
    def configuraciones
        @categories = Category.all
    end
    def set_shopping_cart
        if cookies[:shopping_cart_id].blank?
            @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
            cookies[:shopping_cart_id] = @shopping_cart.id
        else
            @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
        end
        # Evitar fallo por perdida o cambio de informacion en las cookies
        rescue ActiveRecord::RecordNotFound => e
            @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
            cookies[:shopping_cart_id] = @shopping_cart.id
    end
end
