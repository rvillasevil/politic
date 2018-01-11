class VotesController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy, :index, :update_like, :update_dislike]

	def create
	@micropost = Micropost.find(params[:micropost_id])
	@vote = @micropost.votes.build(vote_params)
		if 	@vote.save
      respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
		else
			@feed_items = []
      render 'static_pages/home'
	   end
  end

  def destroy
	  @vote.destroy
	   flash[:success] = "vote deleted"
	   redirect_to request.referrer || root_url
  end

  def index
  	@user = User.find(params[:id])
  	@voter = User.where(:user_id => vote.user.id)
  	@micropost = Micropost.find(params[:id])
  	@votes = @micropost.votes.paginate(page: params[:page])
  end

  def update_like
    @micropost = Micropost.find(params[:micropost_id])
    if @micropost.votes.where(:user_id => current_user.id).update(like: 1, dislike: 0)
      respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
    else
    end
  end

  def update_dislike
    @micropost = Micropost.find(params[:micropost_id])
    if @micropost.votes.where(:user_id => current_user.id).update(like: 0, dislike: 1)
      respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
    else
    end
  end


 private

    def vote_params
      params.require(:vote).permit(:micropost_id, :user_id, :like, :dislike)
    end

end