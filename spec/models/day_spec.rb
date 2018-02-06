require 'rails_helper'

RSpec.describe Day, type: :model do
  subject(:day) { build(:day) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:day_index) }

  it { is_expected.to belong_to(:week) }

  describe 'instance methods' do
    describe '#day_name' do
      let(:day) { build_stubbed(:day, day_index: @index) }

      it 'Sunday' do
        @index = 0
        expect(day.day_name).to eq('Sunday')
      end

      it 'Monday' do
        @index = 1
        expect(day.day_name).to eq('Monday')
      end

      it 'Tuesday' do
        @index = 2
        expect(day.day_name).to eq('Tuesday')
      end

      it 'Wednesday' do
        @index = 3
        expect(day.day_name).to eq('Wednesday')
      end

      it 'Thursday' do
        @index = 4
        expect(day.day_name).to eq('Thursday')
      end

      it 'Friday' do
        @index = 5
        expect(day.day_name).to eq('Friday')
      end

      it 'Saturday' do
        @index = 6
        expect(day.day_name).to eq('Saturday')
      end
    end
  end
end
