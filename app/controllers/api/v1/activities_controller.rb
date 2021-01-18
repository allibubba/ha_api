class Api::V1::ActivitiesController < ApplicationController
  def index
  end

  def create
    @activity = Activity.new(activity_params)
    if @ctivity.save
      render json: @ctivity
    else
      render error: {error: 'invalid', message: @ctivity.errors}, status: 400 # unless @activity.valid?
    end
  end

  def update
  end
  
  private

  def activity_params
    params.require(:operation)
    params.require(:equipment_id)
  end

end
