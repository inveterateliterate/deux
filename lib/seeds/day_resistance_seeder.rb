module DayResistanceSeeder
  def assign_resistance_exercises
    assign_even_weeks
    assign_odd_weeks
    assign_intervals
  end

  def assign_even_weeks
    orders = [1,2,3,4]
    Week.where(num: [2, 4, 6, 8, 10, 12]).each do |week|
      assign_leg_back_abs(orders, week)
      assign_chest_arm_abs(orders, week)
      assign_full_bodies(FullBody.first, week)
    end
  end

  def assign_odd_weeks
    orders = [5, 6, 7, 8]
    Week.where(num: [3, 5, 7, 9, 11]).each do |week|
      assign_leg_back_abs(orders, week)
      assign_chest_arm_abs(orders, week)
      assign_full_bodies(FullBody.second, week)
    end
  end

  def assign_leg_back_abs(orders, week)
    exercises = LegsBackAb.where(order: orders)
    day = week.days.for_day(1).first
    exercises.each do |ex|
      DayResistanceExercise.create!(day: day, resistancable: ex)
    end
  end

  def assign_chest_arm_abs(orders, week)
    exercises = ArmsChestAb.where(order: orders)
    day = week.days.for_day(3).first
    exercises.each do |ex|
      DayResistanceExercise.create!(day: day, resistancable: ex)
    end
  end

  def assign_full_bodies(exercise, week)
    day = week.days.for_day(5).first
    DayResistanceExercise.create!(day: day, resistancable: exercise)
  end

  def assign_intervals
    exercise = IntervalExercise.first
    Day.all.each { |day| DayResistanceExercise.create!(day: day, resistancable: exercise) }
  end
end
