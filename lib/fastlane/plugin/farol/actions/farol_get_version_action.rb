module Fastlane
  module Actions
    class FarolGetVersionAction < Action
      def self.run(params)
        api = Farol::Api.new
        token = params[:token]
        verb = 'get'
        method = 'project/version/' + params[:platform]
        api.request(token, verb, method)
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
          FastlaneCore::ConfigItem.new(key: :platform,
                                  env_name: "PLATFORM",
                               description: "The platform you want to get the version",
                                  optional: false,
                                      type: String)
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
