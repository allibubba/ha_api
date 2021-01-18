class Activity < ApplicationRecord
  belongs_to :equipment
  validates :operation, presence: true
  validates :equipment, presence: true
end
