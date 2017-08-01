class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)

      if @comment.save
        msg = { :status => "ok", :message => @comment.as_json }
        render :json => msg
      else
        # format.html { render action: current_user.portfolio }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
  end

  def edit
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to current_user
  end

  def show
  end

  def index
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :portfolio_id)
  end
end
