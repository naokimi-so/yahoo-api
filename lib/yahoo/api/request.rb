require 'faraday'
require 'json'

module Yahoo

  class Request

    def self.get(path,opts,format="json")
      uri = URI.parse("#{path}?#{opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}")
      Yahoo::Response.new(Net::HTTP.get_response(uri),format)
    end

    def self.post(path,access_token,opts,format="json")
      conn = Faraday.new(:url => path) do |c|
        c.adapter Faraday.default_adapter
        c.headers['Authorization'] = "Bearer " + access_token
        c.headers['Content-Type'] = "application/json"
        c.body = opts.to_json
      end
      Yahoo::Response.new(conn.body,format)
    end

  end

end
