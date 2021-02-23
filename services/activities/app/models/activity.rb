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
  belongs_to :equipment, optional: false
  validates :equipment, presence: true
  validates :event_type, presence: true # // action eg. power, dim, lock
  validates :event_value, presence: true # // message, eg on, off, 80%
  validate :ensure_equipment_action_availability
  validate :ensure_equipment_action_value_availability

  has_one :location, :through => :equipment

  include Emittable

  scope :by_equipment, ->(id) { where("equipment_id = ?", id) }
  scope :by_protocol, ->(protocol) { self.includes(:equipment).where(equipment: {protocol: p}) }

  def ensure_equipment_action_availability
    if equipment&.available_events&.keys&.exclude? event_type.to_sym
      errors.add(:event_type, "invalid, valid types include: #{equipment&.available_events&.keys}")
    end
  end

  def ensure_equipment_action_value_availability
    if equipment&.available_events&.fetch(event_type.to_sym)&.exclude? event_value.to_sym
      errors.add(:event_type, "invalid, valid types include: #{equipment&.available_events[event_type]}")
    end
  end

  # TODO: need to decouple this
  def topic
    [self.class.name, 
     self.location.name, 
     self.equipment.safe_name, 
     self.event_type.to_s ].map(&:downcase).join('/')
  end
end
