class FavoritesController < ApplicationController
  def create
    @institution = Institution.find(params[:institution_id])
    # if @institution.user_id != current_user.id
      @favorite  = Favorite.create(user_id: current_user.id, institution_id: @institution.id)
    # end
  end

  def destroy
    @institution = Institution.find(params[:institution_id])
    @favorite = Favorite.find_by(user_id: current_user.id, institution_id: @institution.id)
    @favorite.destroy
  end
end
