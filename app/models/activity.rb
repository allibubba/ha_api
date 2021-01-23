class Activity < ApplicationRecord
  belongs_to :equipment
  validates :operation, presence: true
  validates :equipment, presence: true
  has_one :location, :through => :equipment

  include Emittable

  def topic
    [self.class.name, 
     self.location.name.downcase, 
     self.equipment.name, 
     self.operation ].map(&:downcase).join('/')
  end
end
