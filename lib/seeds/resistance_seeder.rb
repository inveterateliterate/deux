module ResistanceSeeder
  def create_resistance_exercises
    create_legs_back_abs
    create_arms_chest_abs
    create_full_bodies
    create_intervals
  end

  private

  def create_legs_back_abs
    create_even_weeks_legs_back_abs
    create_odd_weeks_legs_back_abs
  end

  def create_even_weeks_legs_back_abs
    exercises = even_weeks_legs_back_abs_circuits.map.with_index do |ex, index|
      { order: index + 1, exercises: ex}
    end
    LegsBackAb.create!(exercises)
  end

  def create_odd_weeks_legs_back_abs
    exercises = odd_weeks_legs_back_abs_circuits.map.with_index do |ex, index|
      { order: index + 1, exercises: ex }
    end
    LegsBackAb.create!(exercises)
  end

  def even_weeks_legs_back_abs_circuits
    [
      {
        'Kettlebell squats' => 20,
        'Back extensions with weights' => 15,
        'Runners (abs, each)' => 20
      },
      {
        'Stability ball curls' => 20,
        'Lat pulldowns' => 15,
        'Around the World (abs)' => 15
      },
      {
        'Step-ups with weights (ea)' => 10,
        'Low band row' => 20,
        'Burpees' => 10
      },
      {
        'Bench lunges with weight (back foot on bench, ea)' => 15,
        'Strap pull-ups' => 12,
        'Plank (min)' => 1
      }
    ]
  end

  def odd_weeks_legs_back_abs_circuits
    [
      {
        'Leg press' => 15,
        'Supermans' => 15,
        'Runners (abs, ea)' => 20
      },
      {
        'Leg curls' => 20,
        'Lat pulldowns' => 15,
        'Around the World (abs)' => 15
      },
      {
        'Box jumps' => 20,
        'Seated row' => 20,
        'Burpees' => 10
      },
      {
        'Squat jumps' => 20,
        'Strap pull-ups' => 12,
        'Plank (min)' => 1
      }
    ]
  end

  def create_arms_chest_abs
    create_even_weeks_arms_chest_abs
    create_odd_weeks_arms_chest_abs
  end

  def create_even_weeks_arms_chest_abs
    exercises = even_weeks_arms_chest_abs_circuits.map.with_index do |ex, index|
      { order: index + 5, exercises: ex }
    end
    ArmsChestAb.create!(exercises)
  end

  def create_odd_weeks_arms_chest_abs
    exercises = odd_weeks_arms_chest_abs_circuits.map.with_index do |ex, index|
      { order: index + 5, exercises: ex }
    end
    ArmsChestAb.create!(exercises)
  end

  def even_weeks_arms_chest_abs_circuits
    [
      {
        'DB bench press' => 15,
        'Tricep pushdown' => 15,
        'Side plank (ea, sec)' => 30
      },
      {
        'Shoulder press' => 15,
        'Bicep curls (ea)' => 10,
        'Russian twists with weights' => 50
      },
      {
        'Push-up circuit (close grip, decline, wide grip, ea)' => 10,
        'Laying down tricep extension' => 15,
        'Rollouts' => 15
      },
      {
        'Shoulder circuit (side raises, bent arm side raises, front raises, ea)' => 10,
        'Sit-up with weight' => 25,
        'Leg hip raises' => 20
      }
    ]
  end

  def odd_weeks_arms_chest_abs_circuits
    [
      {
        'Bench press' => 15,
        'Tricep extensions' => 15,
        'Side plank (ea, sec)' => 30
      },
      {
        'Seated shoulder press' => 15,
        'Hammer curls (ea)' => 10,
        'Russian twists with weights' => 50
      },
      {
        'Medicine ball pushups' => 10,
        'Bench dips' => 20,
        'Rollouts' => 15
      },
      {
        'Shoulder circuit (side raises, bent arm side raises, front raises, ea)' => 10,
        'Decline sit-ups with medicine ball' => 25,
        'Leg hip raises' => 20
      }
    ]
  end

  def create_full_bodies
    create_even_weeks_full_bodies
    create_odd_weeks_full_bodies
  end

  def create_even_weeks_full_bodies
    FullBody.create!(
      exercises: {
        'Barbell Squats' => 15,
        'Lunges with weights (front and back, ea)' => 15,
        'RDLs' => 15,
        'Thrusters with weights' => 20,
        'DB incline bench' => 15,
        'Medicine ball push-ups' => 10,
        'Alternate shoulder raise' => 12,
        'Tricep kickbacks (ea)' => 15,
        'DB row' => 15,
        'Wall throws (ea)' => 15,
        'Toe touches' => 30,
        'Decline situps' => 25
      }
    )
  end

  def create_odd_weeks_full_bodies
    FullBody.create!(
      exercises: {
        'Barbell Squats' => 15,
        'Lunge jumps (ea)' => 15,
        'RDLs' => 15,
        'Thrusters with weights' => 20,
        'DB incline bench' => 15,
        'Burpees' => 20,
        'Alternate shoulder raise' => 12,
        'Tricep kickbacks (ea)' => 15,
        'DB row' => 15,
        'Wall throws (ea)' => 15,
        'Toe touches' => 30,
        'Mountain Climbers' => 25
      }
    )
  end

  def create_intervals
    IntervalExercise.create!(
      exercises: {
        'Jump rope' => 200,
        'Row' => 500,
        'Run' => 0.25
      }
    )
  end
end
