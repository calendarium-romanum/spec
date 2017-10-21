require 'json'

module CalendariumRomanum
  module Spec
    class TestedImplementation
      def initialize(exe_path, calendar_settings)
        @executable = exe_path
      end

      def call(date)
        output = `#{@executable} #{date}`
        JSON.load output
      end
    end
  end
end
