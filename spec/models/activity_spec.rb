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
require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
