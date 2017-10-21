module CalendariumRomanum
  module Spec
    class ReferenceImplementation
      def initialize(calendar_settings=nil)
        calendar_settings ||= {}

        @calendar = CR::PerpetualCalendar.new
      end

      def call(date)
        Serializer.(@calendar.day(date))
      end
    end
  end
end
