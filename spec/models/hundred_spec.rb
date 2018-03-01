require 'rails_helper'

RSpec.describe Hundred, type: :model do
  subject { build(:hundred) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:num_times) }
end
