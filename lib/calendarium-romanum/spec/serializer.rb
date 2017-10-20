module CalendariumRomanum
  module Spec
    class Serializer
      def initialize(calendar)
        @calendar = calendar
      end

      def call(date)
        serialize @calendar.day(date)
      end

      def serialize(day)
        {
          'date' => day.date.to_s,
          'season' => day.season.symbol.to_s,
          'season_week' => day.season_week,
          'celebrations' => [],
        }
      end
    end
  end
end
