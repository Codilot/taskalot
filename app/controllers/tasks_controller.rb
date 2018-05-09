class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_tasks, only: [:edit, :update, :destroy]

  def index
    respond_to :html, :js
  end

  def new
    @task = Task.new
    respond_to :html, :js
  end

  def create
    @task  = Task.create(task_params)
    respond_to :html, :js
  end

  def update
    @task.update_attributes(task_params)
    respond_to :html, :js
  end

  def destroy
    @task.destroy
    respond_to :html, :js
  end

  private

    def all_tasks
      @tasks = Task.all
    end

    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end


end
