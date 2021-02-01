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
class LightBulb < Equipment
end
