require 'faraday'
require 'open-uri'

module Yahoo

  class Request

    def self.get(path,opts,format="json")
      uri = URI.parse("#{path}?#{opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}")
      Yahoo::Response.new(Net::HTTP.get_response(uri),format)
    end

    def self.file_get(path,opts,format="json")
      url = "#{path}?#{opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}"
      url
    end

    def self.post(path,access_token,opts,format="json")
      conn = Faraday.new(:url => path) do |c|
        c.adapter Faraday.default_adapter
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post {|req| req.body = opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')},format)
    end

    def self.post_file(path,access_token,opts,format="json")
      conn = Faraday.new(:url => path + "?seller_id=#{opts[:seller_id]}") do |c|
        c.adapter Faraday.default_adapter
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post { |req|
        req.body = opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')
        p req.body
      },format)
    end

  end

end
