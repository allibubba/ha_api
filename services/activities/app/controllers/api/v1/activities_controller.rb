class Api::V1::ActivitiesController < ApplicationController
  def index
    # TODO: filters TBD
    render json: Activity.all
  end

  def create
    activity = Activity.new(activity_params)
    if activity.save
      render json: activity
    else
      render json: {status: 400, message: activity.errors.full_messages}
    end
  end

  def update
  end
  
  private

  def activity_params
    params.require(:activity).permit(:event_type, :event_value, :equipment_id)
  end
end
