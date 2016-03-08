class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])

    @comment = @task.comments.create(comment_params)

    redirect_to task_path(@task)
  end

  # DELETE /tasks/1/comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to task_path(@task), notice: "Comment deleted" }
      format.json { head :no_content }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body)
    end

    def set_comment
      @task = Task.find(params[:task_id])
      @comment = Comment.find(params[:id])
    end

end
