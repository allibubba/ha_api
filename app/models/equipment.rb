class Equipment < ApplicationRecord
  belongs_to :location
  enum protocol: { zwave: 0, zigbee: 1, wifi: 2, proprietary: 3  }

  private

  def boolean_values
    Array([true, false])
  end

  def range_values
    (0..100).to_a
  end
end
