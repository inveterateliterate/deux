module Seeds
  class Seeder
    class << self
      include RunSeeder
      include DayRunSeeder
      include ResistanceSeeder
      include DayResistanceSeeder

      NUM_WEEKS = 12

      def seed
        puts 'cleaning db...'
        clean_db
        puts 'creating schedule...'
        create_weeks
        create_days
        puts 'creating running exercises...'
        create_running_exercises
        puts 'creating resistance exercises...'
        create_resistance_exercises
        puts 'creating program...'
        create_program
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(DayResistanceExercise IntervalExercise CircuitExercise DayRunningExercise MileRun SpeedTraining Hundred LongRun Day Week)
      end

      def create_weeks
        NUM_WEEKS.times { |n| Week.create!(num: n + 1, status: Week::Statuses::NOT_STARTED) }
      end

      def create_days
        days = []
        Week.all.each do |week|
          # Monday through Friday
          (1..5).each do |day_ind|
            days << {
              day_index: day_ind,
              week: week
            }
          end
        end
        Day.create!(days)
      end

      def create_program
        assign_running_exercises
        assign_resistance_exercises
      end
    end
  end
end
