class Api::V1::ActivitiesController < ApplicationController
  def index
  end

  def create
    @activity = Activity.new({"operation"=>"0", "equipment_id"=>"376595269"})
    if @activity.save
      render json: @activity
    else
      render error: {error: 'invalid', message: @ctivity.errors}, status: 400 # unless @activity.valid?
    end
  end

  def update
  end
  
  private

  def allowed_params
    params.require(:activity)
    # params.require(:operation)
    # params.require(:equipment_id)
  end

end
