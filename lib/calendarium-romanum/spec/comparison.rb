module CalendariumRomanum
  module Spec
    # Compares results of CalendariumRomanum and the tested
    # calendar implementation.
    class Comparison
      def initialize(exe_path, settings={})
        @executable = exe_path
        @settings = settings

        @reference = build_reference
        @tested = build_tested
      end

      Result = Struct.new(:expected, :actual)

      def call(date)
        Result.new(@reference.(date), @tested.(date))
      end

      private

      def build_reference
        slice ReferenceImplementation.new(@settings[:calendar])
      end

      def build_tested
        slice TestedImplementation.new(@executable, @settings[:calendar])
      end

      def slice(implementation)
        fields = @settings[:slice].collect(&:to_s)
        Slicer.new implementation, fields
      end
    end
  end
end
