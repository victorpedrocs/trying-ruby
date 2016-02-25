class TimersController < ApplicationController
  before_action :set_timer, only: [:update, :edit]

  def new
  end

  def create
    @task = Task.find params[:task_id]

    @timer = @task.timers.create(timer_params)
    redirect_to task_path @task, @timer
  end

  def edit
  end

  def update
    if @timer.update timer_params
      Rails.logger.debug "TIMER PARAMS: id => #{@timer.id}; start => #{@timer.start}; finish => #{@timer.finish}"
      redirect_to task_path @task
    end
  end

  private
    def set_timer
      @task = Task.find params.require(:task_id)
      @timer = @task.timers.find(params[:id])
    end

    def timer_params
      form_params = params.require(:timer).permit :start, :finish
      return form_params
    end

end
