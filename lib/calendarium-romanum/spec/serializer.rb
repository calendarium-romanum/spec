module CalendariumRomanum
  module Spec
    class Serializer
      class << self
        def call(day)
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
end
