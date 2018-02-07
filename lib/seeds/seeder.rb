module Seeds
  class Seeder
    class << self

      NUM_WEEKS = 12

      def seed
        puts 'cleaning db...'
        clean_db
        puts 'creating schedule...'
        create_days
        puts 'creating running exercises'
        create_running_exercises
        puts 'creating program...'
        create_program
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(DayRunningExercise MileRun SpeedTraining Hundred LongRun Day)
      end

      def create_days
        days = []
        NUM_WEEKS.times do |n|
          # Monday through Friday
          (1..6).each do |day_ind|
            days << {
              day_index: day_ind,
              week_num: n + 1
            }
          end
        end
        Day.create!(days)
      end

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
      end

      def create_suicides
        suicides = [create_one_fiftys, create_three_hundreds].flatten
        Suicide.create!(suicides)
      end

      def create_one_fiftys
        150s = (3..5).map do |num|
          {
            num_times: num*2,
            int_yds: 25,
            int_times: 3,
            round_minutes_rest: 1
          }
        end
      end

      def create_three_hundreds
        300s = (4...6).map do |num|
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
            # type: MileRun::MileRunTypes::HALF_MILE,
            num_times: 3,
            time_per: 3.5,
            rest_between: 3
          },
           {
            # type: MileRun::MileRunTypes::HALF_MILE,
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
  end
end
