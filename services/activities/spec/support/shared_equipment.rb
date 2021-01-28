require 'spec_helper'

shared_examples 'an Equipment Class' do
  describe 'associations' do
    it { should belong_to(:location) }
  end

  describe 'validations' do
    it { should validate_presence_of(:protocol) }
    it { should validate_presence_of(:name) }
  end
end
