class TimersController < ApplicationController
  before_action :set_timer, only: [:update, :edit, :destroy]

  def new
  end

  def create
    @task = Task.find params[:task_id]

    @timer = @task.timers.create(timer_params)
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Timer started' }
      format.json { render json: @timer.to_json(except: [:created_at, :updated_at]) }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @timer.update timer_params
        format.html { redirect_to @task, notice: 'Timer stopped' }
      end
    end

  end

  def destroy
    @timer.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Timer deleted' }
      format.json { render json: @timer.to_json(except: [:created_at, :updated_at]) }
    end
  end

  private
    def set_timer
      @timer = Timer.find(params[:id])
      @task = @timer.task
    end

    def timer_params
      form_params = params.require(:timer).permit :start, :finish
    end

end
