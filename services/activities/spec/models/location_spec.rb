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
require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should define_enum_for(:category).with_values([:interior, :exterior]) }
    it { should have_many(:equipment) }
  end
end
