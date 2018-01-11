class GroupsController < ApplicationController

	def create
		@user = current_user
  	@group = current_user.groups.build(group_params)
  	if @group.save
      #flash[:success] = "Ahora sigues a la plaza!"
      #redirect_back fallback_location: user_plazas_path(current_user.id)
      respond_to do |format|
      format.html { redirect_back fallback_location: user_plazas_path(current_user.id) }
      format.js
    end
    else

    end
    
  end

  def destroy
    @group = current_user.groups.find(params[:group][:id])
    @group.destroy
    #flash[:success] = "Lobby eliminado"
    #redirect_back fallback_location: user_plazas_path(current_user.id)
    respond_to do |format|
      format.html { redirect_back fallback_location: user_plazas_path(current_user.id) }
      format.js
    end
  end


private

    def group_params
      params.require(:group).permit(:user_id, :plaza_id)
    end
    def correct_user
      @group = current_user.plaza.groups.find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end

end
