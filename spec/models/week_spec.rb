require 'rails_helper'

RSpec.describe Week, type: :model do
  subject { build(:week) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:num) }
end
