class CommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])

    @comment = @task.comments.create(comment_params)

    redirect_to task_path(@task)
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body)
    end

end
