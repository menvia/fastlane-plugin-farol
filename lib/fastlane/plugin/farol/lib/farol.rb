module Fastlane
  module Farol
    class Api
      def request(token, verb, method, form_data = nil)
        farolURL = 'https://frl.io:443'

        # Create Cognito credentials
        url = URI(farolURL + '/' + method)
        Net::HTTP.start(url.host, url.port,
                        use_ssl: url.scheme == 'https') do |http|

          if verb == 'post'
            request = Net::HTTP::Post.new url
            request.set_form_data(form_data)
          elsif verb == 'put'
            request = Net::HTTP::Put.new url
          else
            request = Net::HTTP::Get.new url
          end

          request['authorization'] = token
          response = http.request request # Net::HTTPResponse object
          case response
          when Net::HTTPSuccess
            return JSON.parse response.read_body
          when Net::HTTPUnauthorized
            UI.error("Farol: #{response.message} - is your authorization token correct?")
          when Net::HTTPServerError
            UI.error("Farol: #{response.message} - try again later?")
          else
            UI.error("Farol: #{response.message}")
          end
          return false
        end
      end
    end
  end
end
