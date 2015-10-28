class WorkoutsController < ApplicationController
  
  before_filter :load_client


  def new
    @workout = @client.workouts.build
  end

  def create
    @workout = @client.workouts.build(workout_params)
    
    if @workout.save
      redirect_to @client, notice: "Workout was created successfully."
    else
      render :new
    end
  end

  def update
    @workout = @client.workouts.find(params[:id])

    if @workout.update_attributes(workout_params)
      redirect_to client_path(@client)
    else
      render :edit
    end

  end

  def edit
    @workout = @client.workouts.find(params[:id])
  end

  def destroy
    @workout = @client.workouts.find(params[:id])
    @workout.destroy
    redirect_to @client
  end

  def index
  end

  def show
  end

  protected

  def load_client
    @client = Client.find(params[:client_id])
  end

  def workout_params
    params.require(:workout).permit(:title, :date, :description)
  end

end
