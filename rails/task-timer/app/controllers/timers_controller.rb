class TimersController < ApplicationController
  before_action :set_timer, only: [:update, :edit]

  def new
    @task = Task.find params[:task_id]
    create
  end

  def create
    @timer = @task.timers.create(timer_params_start)
    redirect_to task_path @task, @timer
  end

  def edit
    if @timer.update timer_params_stop
      redirect_to task_path @task
    end
  end

  def update

  end

  private
    def set_timer
      @task = Task.find(params[:task_id])
      @timer = @task.timers.find(params[:id])
    end

    def timer_params_start
      form_params = { start: Time.now }
    end

    def timer_params_stop
        form_params = { finish: Time.now}
    end

end
