class TasksController < ApplicationController
  def index
# @tasks=['stay cool','say no to drugs']
# remove it to
@tasks= Task.all
  end
  
  # show in the server how its taking the data using sql
Def new
p @tasks= Task.new
end

def create
    @tasks = Task.new(task_params)
    if @tasks.save
    redirect_to tasks_path
  
  else
    render 'new'
    
    end  
end


# if getting error it means associated action is missing open the task controller

def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    redirect_to tasks_path
  else
    render 'edit'
  end
  end  

def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end  
  
  def show
  @task = Task.find(params[:id])  
 end  
 
 def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed, params[:completed])
    redirect_to tasks_path
  End

private
# nown as whitelist paramters
  def task_params
    params.require(:task).permit(:title,:details,:completed)
    
  end





