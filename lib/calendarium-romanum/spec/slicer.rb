module CalendariumRomanum
  module Spec
    class Slicer
      def initialize(slicee, fields)
        @slicee = slicee
        @fields = fields
      end

      def call(*args)
        hash = @slicee.(*args)
        @fields ? hash.slice(*@fields) : hash
      end
    end
  end
end
