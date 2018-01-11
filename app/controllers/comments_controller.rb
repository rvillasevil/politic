class CommentsController < ApplicationController

	def new
    @micropost = Micropost.find(params[:micropost_id])
  end

  def create
	@micropost = Micropost.find(params[:micropost_id])
	@comment = @micropost.comments.build(comment_params)
		if 	@comment.save
			respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
		else

	   end
  end

  	def destroy
	    @comment.destroy
	    flash[:success] = "comment deleted"
	    redirect_to request.referrer || root_url
  	end

  	def index
  		@user = User.find(params[:id])
  		@commenter = User.where(:user_id => comment.user.id)
  		@micropost = Micropost.find(params[:id])
  		@comments = @micropost.comments.paginate(page: params[:page])
  	end


 private

    def comment_params
      params.require(:comment).permit(:contenido, :content, :user_id, :reply)
    end

end
