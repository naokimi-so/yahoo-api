module Yahoo

  class Api

    class Helper
      ENDPOINT = "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/"

      def get(method,opts={},format="xml")
        p "==========3============"
        Yahoo::Request.get(ENDPOINT+method, Yahoo::Api.merge_pro(opts), format)
        p "==========4============"
      end

      def post(method,opts={},format="xml")
        Yahoo::Request.post(ENDPOINT+method,Yahoo::Api.access_token ,opts, format)
      end

    end

  end

end
