# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  event_type   :string           not null
#  event_value  :string           not null
#  equipment_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Activity, type: :model do
  fixtures :equipment

  let(:activity) do
    Activity.new({ equipment: equipment(:main_switch),
    event_type: :foo, event_value: :bar, })
  end

  describe 'associations' do
    it { should belong_to(:equipment) }
  end

  describe 'validations' do
    it { should validate_presence_of(:equipment) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:event_value) }
  end

  context 'valid model' do 
    it 'validates' do
      expect(activity).to be_valid
    end
  end
end
