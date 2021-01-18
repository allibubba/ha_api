class Equipment < ApplicationRecord
  belongs_to :location
  enum protocol: { zwave: 0, zigbee: 1, wifi: 2, proprietary: 3  }
end
