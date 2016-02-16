class TimersController < ApplicationController
  before_action :set_timer, only: [:update]

  def create
    Date.current
    @timer = Timer.new(timer_params)
  end

  def update
  end

  private
    def set_task
      @timer = Timer.find(params[:id])
      @task = Task.find(@timer.task_id)
      @user = User.find(@timer.user_id)
    end

    def timer_params
      form_params = params.require(:timer).permit(:name, :description, :project_id)
      form_params.merge!( { project_id: params.require(:project)[:id] } )
    end

end
