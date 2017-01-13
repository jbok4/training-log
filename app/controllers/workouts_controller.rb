class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all.order('created_at DESC')
  end

  def new
    @workout = Workout.new
    3.times do 
      @workout.exercises.build
    end
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:notice] = "Successfully created workout."
      redirect_to @workout
    else
      render "new"
    end
  end

  def show
    #render json: @workout
  end

  def edit
  end

  def update
    if @workout.update_attributes(workout_params)
      flash[:notice] = "Successfully updated workout."
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    flash[:notice] = "Successfully destroyed workout."
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :duration, :exercises_attributes)
  end

  def find_workout
    @workout = Workout.find_by_id(params[:id])
  end


end
