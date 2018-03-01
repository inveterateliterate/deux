require 'rails_helper'

RSpec.describe LongRun, type: :model do
  subject { build(:long_run) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:amt_time) }
end
