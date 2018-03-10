module Yahoo

  class Api

    class Image

      ItemImageList = "Yahoo::Api::Image.item_image_list"
      UploadItemImage = "Yahoo::Api::Image.upload_item_image"
      UploadItemImagePack = "Yahoo::Api::Image.upload_item_image_pack"
      DeleteItemImage = "Yahoo::Api::Image.delete_item_image"
      LibImageList = "Yahoo::Api::Image.lib_image_list"
      UploadLibImage = "Yahoo::Api::Image.upload_lib_image"
      UploadLibImagePack = "Yahoo::Api::Image.upload_lib_image_pack"
      DeleteLibImage = "Yahoo::Api::Image.delete_lib_image"
      LibDirectoryList = "Yahoo::Api::Image.lib_directory_list"
      AddLibDirectory = "Yahoo::Api::Image.add_lib_directory"
      MoveLibDirectory = "Yahoo::Api::Image.move_lib_directory"
      DeleteLibDirectory = "Yahoo::Api::Image.delete_lib_directory"


      class << self

        def item_image_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/itemImageList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def upload_item_image(opts={})
          Yahoo::Request.post_file("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadItemImage", Yahoo::Api.access_token ,opts, "xml")
        end

        def upload_item_image_pack(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadItemImagePack", Yahoo::Api.access_token ,opts, "xml")
        end

        def delete_item_image(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteItemImage",Yahoo::Api.access_token ,opts,"xml")
        end

        def lib_image_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/libImageList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def upload_lib_image(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadLibImage",Yahoo::Api.access_token ,opts,"xml")
        end

        def upload_lib_image_pack(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/uploadLibImagePack", Yahoo::Api.access_token ,opts, "xml")
        end

        def delete_lib_image(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteLibImage", Yahoo::Api.access_token ,opts, "xml")
        end

        def lib_directory_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/libDirectoryList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def add_lib_directory(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/addLibDirectory", Yahoo::Api.access_token ,opts,"xml")
        end

        def move_lib_directory(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/moveLibDirectory", Yahoo::Api.access_token ,opts,"xml")
        end

        def delete_lib_directory(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteLibDirectory", Yahoo::Api.access_token ,opts,"xml")
        end

      end

    end

  end

end
