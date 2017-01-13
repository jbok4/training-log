class ExercisesController < ApplicationController

  def index
    @workout = Workout.find(params[:workout_id])
    @exercises = @workout.exercises
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(params[:exercise])

    redirect_to workout_path(@workout)
  end



  def show
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:id])
  end


end
