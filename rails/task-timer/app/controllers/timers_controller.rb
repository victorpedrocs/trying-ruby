class TimersController < ApplicationController
  before_action :set_timer, only: [:update]

  def create
    @task = Task.find params.require(:task)[:id]
    @timer = @task.timers.create(timer_params)

    redirect_to task_path(@task)
  end

  def update
  end

  private
    def set_timer
      @timer = Timer.find(params[:id])
      @task = Task.find(@timer.task_id)
      @user = User.find(@timer.user_id)
    end

    def timer_params
      form_params = { task_id: params.require(:task)[:id] }
      form_params.merge!( { start: Time.now } )
    end

end
