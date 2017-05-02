module Fastlane
  module Helper
    class FarolHelper
      # class methods that you define here become available in your action
      # as `Helper::FarolHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the farol plugin helper!")
      end
    end
  end
end
