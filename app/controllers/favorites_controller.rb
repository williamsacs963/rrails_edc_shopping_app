class FavoritesController < ApplicationController

    def create
        favorite = Favorite.new(product_id: params[:product_id], user_id: current_user.id)
        favorite.set_product(params[:product_id],current_user.id)
        if favorite.save
            @response = "Agregado a favoritos"
            render json: {response: @response}
        else
            render json: favorite.errors, status: 400
        end
    end

    def destroy
        favorite = favorite.find(params[:id])
        product = favorite.product
        response = "#{product.p_name} se ha eliminado de favoritos"
        favorite.destroy
        render json: {response: @response}
    end
    
end