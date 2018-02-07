module DayRunSeeder
  def assign_running_exercises
    assign_long_runs
    assign_hundreds
    assign_speed_training
    assign_suicides
    assign_miles
  end

  def assign_long_runs
    (1..4).each do |week|
      day = Day.for_week(week).for_day(1).first# use where or find_by mult attributes?
      long_run = LongRun.find_by(amt_time: 30)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end

    (5..8).each do |week|
      day = Day.for_week(week).for_day(1).first
      long_run = LongRun.find_by(amt_time: 40)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end

    (9..12).each do |week|
      day = Day.for_week(week).for_day(1).first
      long_run = LongRun.find_by(amt_time: 45)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end
  end

  def assign_hundreds
    (1..3).each do |week|
      day = Day.for_week(week).for_day(2).first
      hundred = Hundred.find_by(num_times: 10)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    (4..6).each do |week|
      day = Day.for_week(week).for_day(2).first
      hundred = Hundred.find_by(num_times: 15)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    (7..9).each do |week|
      day = Day.for_week(week).for_day(2).first
      hundred = Hundred.find_by(num_times: 20)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    (10..12).each do |week|
      day = Day.for_week(week).for_day(2).first
      hundred = Hundred.find_by(num_times: 25)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end
  end

  def assign_speed_training
    week_num = 1
    num_times = 6

    3.times do
      sixty = SpeedTraining.sixties.find_by(num_times: num_times)
      forty = SpeedTraining.forties.find_by(num_times: num_times + 2)
      twenty = SpeedTraining.twenties.find_by(num_times: num_times + 4)
      shuttles = SpeedTraining.shuttles.find_by(num_times: num_times - 2)
      (0..3).each do |week|
        day = Day.for_week(week_num + week).for_day(3).first
        DayRunningExercise.create!(day: day, runnable: sixty)
        DayRunningExercise.create!(day: day, runnable: forty)
        DayRunningExercise.create!(day: day, runnable: twenty)
        DayRunningExercise.create!(day: day, runnable: shuttles)
      end
      week_num += 4
      num_times += 2
    end
  end

  def assign_suicides
    thursdays = Day.for_day(4)
    week_num = 1
    one_fifty_num_times = 6
    three_hundred_num_times = 4

    3.times do
      one_fiftys_days = [thursdays.for_week(week_num).first, thursdays.for_week(week_num + 1).first]
      three_hundreds_days = [thursdays.for_week(week_num + 2).first, thursdays.for_week(week_num + 3).first]

      one_fifty = Suicide.one_fiftys.find_by(num_times: one_fifty_num_times)
      three_hundred = Suicide.three_hundreds.find_by(num_times: three_hundred_num_times)

      suicides_hash = {
        one_fifty => one_fiftys_days,
        three_hundred => three_hundreds_days,
      }

      suicides_hash.each do |suicide, days|
        days.each { |day| DayRunningExercise.create!(day: day, runnable: suicide) }
      end

      week_num += 4
      one_fifty_num_times += 2
      three_hundred_num_times +=1
    end
  end

  def assign_miles
    assign_half_miles
    assign_full_miles
  end

  def assign_half_miles
    (1..3).each do |week|
      half_miles = {
        Day.for_week(week).for_day(5).first => HalfMile.find_by(num_times: 3),
        Day.for_week(week + 6).for_day(5).first => HalfMile.find_by(num_times: 4),
      }
      half_miles.each { |day, mile_run| DayRunningExercise.create!(day: day, runnable: mile_run) }
    end
  end

  def assign_full_miles
    (4..6).each do |week|
      full_miles = {
        Day.for_week(week).for_day(5).first => FullMile.find_by(time_per: 7.75),
        Day.for_week(week + 6).for_day(5).first => FullMile.find_by(time_per: 7.5),
      }
      full_miles.each { |day, mile_run| DayRunningExercise.create!(day: day, runnable: mile_run) }
    end
  end
end
