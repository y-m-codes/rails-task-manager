class TasksController < ApplicationController
  def index
    # lists all tasks
    @tasks = Task.all
  end

  def find

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # renders the view for user to input new task details in memory,
    # does not save to DB (not persisted)
    @task = Task.new
  end

  def create
    # makes new task, saves to DB (persisted)
    @task = Task.new(task_params)
    @task.save
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
    # renders the view to get user input to modify an existing record,
    # does not save the input
  end

  def update
    # saves the user changes from "edit" to the DB, updates the record
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # deletes a selected record
  end

  private
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
