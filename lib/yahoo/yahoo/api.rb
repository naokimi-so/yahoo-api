require "net/http"
require "uri"
require "cgi"
require "json"
require 'active_support/core_ext'
require "yahoo/api/version"
require "yahoo/api/response"
require "yahoo/api/request"
require "yahoo/api/product"
require "yahoo/api/shp"
require "yahoo/api/image"
require "yahoo/api/st-category"
require "yahoo/api/store-opening"
require "yahoo/api/stock"
require "yahoo/api/shopping"
require "yahoo/api/auction"
require "yahoo/api/news"
require "yahoo/api/order"

module Yahoo

  class Api

    @@options = {}

    class << self

      def options
        @@options
      end

      def configure(&proc)
        raise ArgumentError, "Block is required." unless block_given?
        yield @@options
      end

      def merge(opts={})
        opts[:appid] = @@options[:appid]
        opts
      end

      def merge_pro(opts={})
        opts[:access_token] = @@options[:access_token]
        opts
      end

      def access_token
        @@options[:access_token]
      end

      def get(method,opts={})
        eval "#{method}(#{opts})"
      end

    end

  end

end
