module Fastlane
  module Farol
    class Api
      def request(token, verb, method, form_data = nil)
        farol_url = 'https://frl.io:443'
        if ENV["FAROL_URL"]
          farol_url = ENV["FAROL_URL"]
        end

        # Create the URL to be called
        url = URI(farol_url + '/' + method)
        response = Net::HTTP.start(url.host, url.port,
                        use_ssl: url.scheme == 'https') do |http|

          if verb == 'post'
            request = Net::HTTP::Post.new url
            if form_data
              request.set_form_data(form_data)
            end
          elsif verb == 'put'
            request = Net::HTTP::Put.new url
            if form_data
              request.set_form_data(form_data)
            end
          else
            request = Net::HTTP::Get.new url
          end

          request['authorization'] = token
          http.request(request) # Net::HTTPResponse object
        end
        case response
        when Net::HTTPSuccess
          if valid_json(response.read_body)
            return JSON.parse response.read_body
          else
            return true
          end
        when Net::HTTPUnauthorized
          UI.error("Farol: #{response.message} - is your authorization token correct?")
        when Net::HTTPServerError
          UI.error("Farol: #{response.message} - try again later?")
        else
          UI.error("Farol: #{response.message}")
        end
        return false
      end

      # Check if the parameter is a valid JSON string
      def valid_json(json)
          JSON.parse(json)
          return true
        rescue JSON::ParserError => e
          return false
      end
    end
  end
end
