# == Schema Information
#
# Table name: equipment
#
#  id          :bigint           not null, primary key
#  type        :string           not null
#  name        :string           not null
#  brand       :string
#  protocol    :integer          not null
#  location_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Equipment < ApplicationRecord
  belongs_to :location
  validates_presence_of :type
  validates_presence_of :name
  validates_presence_of :protocol
  enum protocol: { zwave: 0, zigbee: 1, wifi: 2, proprietary: 3  }

  def safe_name
    self.name.gsub(' ', '_')
  end

  private

  def boolean_values
    Array([true, false])
  end

  def range_values
    (0..100).to_a
  end
end
