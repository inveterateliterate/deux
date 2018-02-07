require 'rails_helper'

RSpec.describe DayRunningExercise, type: :model do
  subject { build(:day_running_exercise, runnable: create(:long_run)) }

  it { is_expected.to be_valid }

  it { is_expected.to belong_to(:day) }
end
