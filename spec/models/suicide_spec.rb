require 'rails_helper'

RSpec.describe Suicide, type: :model do
  subject { build(:speed_training) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:num_times) }
  it { is_expected.to validate_presence_of(:int_yds) }
  it { is_expected.to validate_presence_of(:int_times) }
  it { is_expected.to validate_presence_of(:round_minutes_rest) }
end
