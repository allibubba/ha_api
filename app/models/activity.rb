class Activity < ApplicationRecord
  belongs_to :equipment
  validates :operation, presence: true
  validates :equipment, presence: true
  has_one :location, :through => :equipment

  include Emittable

  def queue_path
    [self.location.name.downcase, self.equipment.name, self.operation].join('/')
  end
end
