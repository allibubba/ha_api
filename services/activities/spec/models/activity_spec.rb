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

  let(:equipment_instance) do
    equipment(:side_door_lock)
  end

  subject do
    Activity.new({
      equipment: equipment_instance, 
      event_type: :state, 
      event_value: :unlock
    })
  end

  describe 'associations' do

    subject do
      Activity.create({
        equipment: equipment_instance, 
        event_type: :state, 
        event_value: :unlock
      })
    end

    it { should be_valid }
    it 'belongs' do
      should belong_to(:equipment)
    end
  end

  describe 'validate actions' do
    before(:each) do
      @equipment_dbl = Equipment.new()
      allow(@equipment_dbl).to receive(:available_events) { {foo: %i[a b]} }
    end

    context 'when event is avaialble' do 
      it '.ensure_equipment_action_availability' do
        activity = Activity.new({ equipment: @equipment_dbl, event_type: :foo, event_value: :a })
        expect(activity).to be_valid
      end
    end

    context 'when event is unavaialble' do 
      it '.ensure_equipment_action_value_availability' do
        activity = Activity.new({ equipment: @equipment_dbl, event_type: :foo, event_value: :c })
        expect(activity).to_not be_valid
      end
    end
  end
end
