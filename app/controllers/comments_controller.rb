class CommentsController < ApplicationController
  before_action :set_service, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = @service.comments.new(comment_params)

    if @comment.save
      redirect_to service_path(@service), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to service_path(@service), notice: "Comment was successfully destroyed."
  end



  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_comment
    @comment = @service.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end