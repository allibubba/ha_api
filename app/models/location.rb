class Location < ApplicationRecord
  enum category: { interior: 0, exterior: 1 }
  has_many :equipment
end
