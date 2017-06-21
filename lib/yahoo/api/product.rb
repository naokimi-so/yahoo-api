module Yahoo

  class Api

    class Product

      MyItemList = "Yahoo::Api::Product.my_item_list"
      GetItem = "Yahoo::Api::Product.get_item"
      SubmitItem = "Yahoo::Api::Product.submit_item"
      EditItem = "Yahoo::Api::Product.edit_item"
      MoveItems = "Yahoo::Api::Product.move_items"
      UpdateItems = "Yahoo::Api::Product.update_items"
      SetItemDisplayPriority = "Yahoo::Api::Product.set_item_display_priority"
      DeleteItem = "Yahoo::Api::Product.delete_item"
      UploadItemFile = "Yahoo::Api::Product.upload_item_file"


      class << self

        def my_item_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/myItemList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def submit_item(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/submitItem", Yahoo::Api.access_token ,opts, "xml")
        end

        def get_item(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getItem", Yahoo::Api.merge_pro(opts), "xml")
        end

        def edit_item(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/editItem",Yahoo::Api.access_token ,opts,"xml")
        end

        def move_items(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/moveItems",Yahoo::Api.access_token ,opts, "xml")
        end

        def update_items(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/updateItems",Yahoo::Api.access_token ,opts,"xml")
        end

        def set_item_display_priority(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setItemDisplayPriority", Yahoo::Api.access_token ,opts, "xml")
        end

        def delete_item(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteItem", Yahoo::Api.access_token ,opts, "xml")
        end

        def upload_item_file(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadItemFile", Yahoo::Api.access_token ,opts,"xml")
        end
      end

    end

  end

end
