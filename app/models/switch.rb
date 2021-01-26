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
class Switch < Equipment
  def available_events
    {power: boolean_values, dimmer: range_values}
  end
end
