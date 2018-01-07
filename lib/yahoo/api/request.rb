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
      conn = Faraday.new(:url => "#{path}?seller_id=#{opts[:seller_id]}") do |c|
        c.request :multipart
        c.request :url_encoded
        c.adapter :net_http
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post { |req|
        req.body = {
          file: Faraday::UploadIO.new(opts[:file_path], opts[:file_type], opts[:file_name])
        }
      },format)
    end

    def self.post_csv(path,access_token,opts,format="json")
      conn = Faraday.new(:url => "#{path}?seller_id=#{opts[:seller_id]}") do |c|
        c.request :multipart
        c.request :url_encoded
        c.adapter :net_http
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post { |req|
        req.body = {
          file: Faraday::UploadIO.new(opts[:file_path], opts[:file_type], opts[:file_name]),
          type: opts[:type]
        }
      },format)
    end

  end

end
