require 'rails_helper'

RSpec.describe MileRun, type: :model do
  subject { build(:mile_run) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:num_times) }
  it { is_expected.to validate_presence_of(:time_per) }
  it { is_expected.to validate_presence_of(:rest_between) }
end
