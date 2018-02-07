FactoryBot.define do
  factory :mile_run do
    type MileRun::MileRunTypes::FULL_MILE
    num_times 2
    time_per 7.5
    rest_between 6
  end

  factory :full_mile, class: FullMile do
    type MileRun::MileRunTypes::FULL_MILE
    num_times 2
    time_per 7.5
    rest_between 6
  end

  factory :half_mile, class: HalfMile do
    type MileRun::MileRunTypes::HALF_MILE
    num_times 3
    time_per 3.5
    rest_between 3
  end
end
