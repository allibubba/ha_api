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
  # TODO: validate values against equipment allowed values
  validates :equipment, presence: true
  validates :event_type, presence: true # // action eg. power, dim
  validates :event_value, presence: true # // message, eg on, off, 80%

  has_one :location, :through => :equipment

  include Emittable

  scope :by_equipment, ->(id) { where("equipment_id = ?", id) }
  scope :by_protocol, ->(protocol) { self.includes(:equipment).where(equipment: {protocol: p}) }

  # TODO: need to decouple this
  def topic
    [self.class.name, 
     self.location.name, 
     self.equipment.safe_name, 
     self.event_type.to_s ].map(&:downcase).join('/')
  end
end
