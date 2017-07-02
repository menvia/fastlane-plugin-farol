module Fastlane
  module Actions
    class FarolApiAction < Action
      def self.run(params)
        # Create Farol Api
        api = Farol::Api.new
        token = params[:token]
        verb = params[:verb]
        method = params[:method]
        form_data = params[:form_data]

        # Download event content
        api.request(token, verb, method, form_data)
      end

      def self.description
        "Enable your app to use Farol Platform services"
      end

      def self.authors
        ["Felipe Plets"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Integrate your app with the Farol Platform using services like push notifications"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :token,
                                  env_name: "TOKEN",
                               description: "The token for your Farol App",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :verb,
                                  env_name: "VERB",
                               description: "The Farol API operation verb",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :method,
                                  env_name: "METHOD",
                               description: "The Method to be performed by the Farol API",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :form_data,
                                  env_name: "FORM_DATA",
                               description: "Data to be sent to the Farol API",
                                  optional: true,
                                      type: Hash)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
