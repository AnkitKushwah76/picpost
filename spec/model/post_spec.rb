require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    describe 'it validates image' do
      it { is_expected.to validate_presence_of(:image) }
    end
  end
end
