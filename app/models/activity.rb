# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  event_type   :string           not null
#  event_value  :string           not null
#  equipment_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Activity < ApplicationRecord
  belongs_to :equipment
  validates :operation, presence: true
  validates :equipment, presence: true
  # TODO: validate values against equipment allowed values
  validates :event_type, presence: true
  validates :event_value, presence: true

  has_one :equipment
  has_one :location, :through => :equipment

  include Emittable

  def topic
    [self.class.name, 
     self.location.name, 
     self.equipment.safe_name, 
     self.operation.to_s ].map(&:downcase).join('/')
  end
end
