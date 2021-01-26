# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  enum category: { interior: 0, exterior: 1 }
  has_many :equipment
end
