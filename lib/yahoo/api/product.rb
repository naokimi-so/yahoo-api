module Yahoo

  class Api

    class Product

      MyItemList = "Yahoo::Api::Product.my_item_list"
      GetItem = "Yahoo::Api::Product.get_item"
      SubmitItem = "Yahoo::Api::Product.submit_item"

      class << self

        def my_item_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/myItemList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def submit_item(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/submitItem", Yahoo::Api.merge_pro(opts), "xml")
        end

        def get_item(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getItem", Yahoo::Api.merge_pro(opts), "xml")
        end
      end

    end

  end

end
