class WorkoutsController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    @workout = @client.workouts.build
  end

  def create
    @client = Client.find(params[:client_id])
    @workout = @client.workouts.build(workout_params)
    
    if @workout.save
      redirect_to @client, notice: "Workout was created successfully."
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  protected

  def workout_params
    params.require(:workout).permit(:title, :date, :description)
  end
end
