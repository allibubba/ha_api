# == Schema Information
#
# Table name: activities
#
#  id              :bigint           not null, primary key
#  operation       :integer
#  equipment_id    :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  operation_value :string           not null
#
class Activity < ApplicationRecord
  belongs_to :equipment
  validates :operation, presence: true
  validates :equipment, presence: true
  has_one :location, :through => :equipment

  include Emittable

  def topic
    [self.class.name, 
     self.location.name, 
     self.equipment.safe_name, 
     self.operation.to_s ].map(&:downcase).join('/')
  end
end
