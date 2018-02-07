module RunSeeder
  def create_running_exercises
    create_long_runs
    create_hundreds
    create_speed_trainings
    create_suicides
    create_mile_runs
  end

  def create_long_runs
    long_runs = [{ amt_time: 30 }, { amt_time: 40 }, { amt_time: 45 }]
    LongRun.create!(long_runs)
  end

  def create_hundreds
    hundreds = [{ num_times: 10 }, { num_times: 15 }, { num_times: 20 }, { num_times: 25 }]
    Hundred.create!(hundreds)
  end

  def create_speed_trainings
    speed_trainings = [create_sixties, create_forties, create_twenties, create_shuttles].flatten
    SpeedTraining.create!(speed_trainings)
  end

  def create_sixties
    (3..5).map do |num|
      {
        num_times: num*2,
        distance: '60',
        rep_seconds_rest: 20,
        round_minutes_rest: 1,
        round_order: 1
      }
    end
  end

  def create_forties
    (4..6).map do |num|
      {
        num_times: num*2,
        distance: '40',
        rep_seconds_rest: 15,
        round_minutes_rest: 1,
        round_order: 2
      }
    end
  end

  def create_twenties
    (5..7).map do |num|
      {
        num_times: num*2,
        distance: '20',
        rep_seconds_rest: 10,
        round_minutes_rest: 2,
        round_order: 3
      }
    end
  end

  def create_shuttles
    (2..4).map do |num|
      {
        num_times: num*2,
        distance: '5/10/15',
        rep_seconds_rest: 15,
        round_order: 4
      }
    end
  end

  def create_suicides
    suicides = [create_one_fiftys, create_three_hundreds].flatten
    Suicide.create!(suicides)
  end

  def create_one_fiftys
    (3..5).map do |num|
      {
        num_times: num*2,
        int_yds: 25,
        int_times: 3,
        round_minutes_rest: 1
      }
    end
  end

  def create_three_hundreds
    (4..6).map do |num|
      {
        num_times: num,
        int_yds: 25,
        int_times: 6,
        round_minutes_rest: 2
      }
    end
  end

  def create_mile_runs
    create_half_miles
    create_full_miles
  end

  def create_half_miles
    half_miles = [
      {
        num_times: 3,
        time_per: 3.5,
        rest_between: 3
      },
      {
        num_times: 4,
        time_per: 3.5,
        rest_between: 3
      }
    ]
    HalfMile.create!(half_miles)
  end

  def create_full_miles
    full_miles = [
      {
        type: MileRun::MileRunTypes::FULL_MILE,
        num_times: 2,
        time_per: 7.75,
        rest_between: 6
      },
      {
        type: MileRun::MileRunTypes::FULL_MILE,
        num_times: 2,
        time_per: 7.5,
        rest_between: 6
      }
    ]
    FullMile.create!(full_miles)
  end
end
