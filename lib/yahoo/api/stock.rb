module Yahoo

  class Api

    class Stock

      GetStock = "Yahoo::Api::Stock.get_stock"
      SetStock = "Yahoo::Api::Stock.set_stock"
      UploadStockFile = "Yahoo::Api::Stock.upload_stock_file"

      class << self

        # 在庫参照API
        def get_stock(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStock", Yahoo::Api.access_token ,opts, "xml")
        end

        # 在庫更新API
        def set_stock(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStock", Yahoo::Api.access_token ,opts, "xml")
        end

        # 在庫アップロードAPI
        def upload_stock_file(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadStockFile", Yahoo::Api.access_token ,opts, "xml")
        end

      end

    end

  end

end
