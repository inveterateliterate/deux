module DayRunSeeder
  def assign_running_exercises
    assign_long_runs
    assign_hundreds
    assign_speed_training
    assign_suicides
    assign_miles
  end

  def assign_long_runs
    Week.where(num: [1, 2, 3, 4]).each do |week|
      day = week.days.for_day(1).first # use where or find_by mult attributes?
      long_run = LongRun.find_by(amt_time: 30)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end

    Week.where(num: [5, 6, 7, 8]).each do |week|
      day = week.days.for_day(1).first
      long_run = LongRun.find_by(amt_time: 40)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end

    Week.where(num: [9, 10, 11, 12]).each do |week|
      day = week.days.for_day(1).first
      long_run = LongRun.find_by(amt_time: 45)
      DayRunningExercise.create!(day: day, runnable: long_run)
    end
  end

  def assign_hundreds
    Week.where(num: [1, 2, 3]).each do |week|
      day = week.days.for_day(2).first
      hundred = Hundred.find_by(num_times: 10)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    Week.where(num: [4, 5, 6]).each do |week|
      day = week.days.for_day(2).first
      hundred = Hundred.find_by(num_times: 15)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    Week.where(num: [7, 8, 9]).each do |week|
      day = week.days.for_day(2).first
      hundred = Hundred.find_by(num_times: 20)
      DayRunningExercise.create!(day: day, runnable: hundred)
    end

    Week.where(num: [10, 11, 12]).each do |week|
      day = week.days.for_day(2).first
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
      (0..3).each do |n|
        week = Week.find_by(num: week_num + n)
        day = week.days.for_day(3).first
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
    week_num = 1
    one_fifty_num_times = 6
    three_hundred_num_times = 4

    3.times do
      one_fiftys_days = [Week.find_by(num: week_num).days.for_day(4).first, Week.find_by(num: week_num + 1).days.for_day(4).first]
      three_hundreds_days = [Week.find_by(num: week_num + 2).days.for_day(4).first, Week.find_by(num: week_num + 3).days.for_day(4).first]

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
    Week.where(num: [1, 2, 3]).each { |week| create_mile_run(week, HalfMile.find_by(num_times: 3)) }

    Week.where(num: [7, 8 , 9]).each { |week| create_mile_run(week, HalfMile.find_by(num_times: 4)) }
  end

  def assign_full_miles
    Week.where(num: [4, 5, 6]).each { |week| create_mile_run(week, FullMile.find_by(time_per: 7.75)) }

    Week.where(num: [10, 11, 12]).each { |week| create_mile_run(week, FullMile.find_by(time_per: 7.5)) }
  end

  def create_mile_run(week, mile_run)
    day = week.days.for_day(5).first
    DayRunningExercise.create!(day: day, runnable: mile_run)
  end
end
