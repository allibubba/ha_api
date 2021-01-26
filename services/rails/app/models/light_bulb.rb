# == Schema Information
#
# Table name: equipment
#
#  id          :bigint           not null, primary key
#  type        :string
#  name        :string
#  brand       :string
#  protocol    :integer
#  location_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LightBulb < Equipment
end
