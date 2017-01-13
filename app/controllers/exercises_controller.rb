class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(params[:workout].permit(:name, :sets, :reps))

    redirect_to workout_path(@workout)
  end


end
