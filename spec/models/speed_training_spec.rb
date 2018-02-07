require 'rails_helper'

RSpec.describe SpeedTraining, type: :model do
  subject { build(:speed_training) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:num_times) }
  it { is_expected.to validate_presence_of(:distance) }
  it { is_expected.to validate_presence_of(:rep_seconds_rest) }
  it { is_expected.to validate_presence_of(:round_seconds_rest) }
  it { is_expected.to validate_presence_of(:round_order) }
end
