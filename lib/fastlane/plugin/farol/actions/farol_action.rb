module Fastlane
  module Actions
    class FarolAction < Action
      def self.run(params)
        base_folder	= ''
        target_folder	= base_folder + 'Target/'

        # Reset target folder
        FileUtils.rm_rf Dir.glob(target_folder)
        Dir.mkdir(target_folder)

        # Create Farol Api
        api = Farol::Api.new
        token = params[:token]

        # Download event content
        result = api.request(token, 'get', 'event/event')
        self.save_file('Event', result)

        # Download app content
        result = api.request(token, 'get', 'app/' + params[:app_id])
        self.save_file('App', result)
      end

      def self.save_file(file_name, result)
        base_folder	= ''
        target_folder	= base_folder + 'Target/'
        File.open(target_folder + file_name + '.json', 'w') do |f|
          f.puts JSON.pretty_generate(result)
        end
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
          FastlaneCore::ConfigItem.new(key: :app_id,
                                  env_name: "APP_ID",
                               description: "The app id for your Farol App",
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
