module Yahoo

  class Api

    class Design

      GetPreviewHtml = "Yahoo::Api::Design.get_preview_html"
      GetCustomPageDesign = "Yahoo::Api::Design.get_custom_page_design"
      EditCustomPageDesign = "Yahoo::Api::Design.edit_custom_page_design"
      GetCustomPageList = "Yahoo::Api::Design.get_custom_page_list"
      DeleteCustomPage = "Yahoo::Api::Design.delete_custom_page"
      GetStoreinfoFreespace = "Yahoo::Api::Design.get_storeinfo_freespace"
      SetStoreinfoFreespace = "Yahoo::Api::Design.set_storeinfo_freespace"

      class << self

        # プレビューHTML参照API
        def get_preview_html(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getPreviewHtml", Yahoo::Api.merge_pro(opts), "xml")
        end

        # カスタムページ参照API
        def get_custom_page_design(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getCustomPageDesign", Yahoo::Api.merge_pro(opts), "xml")
        end

        # カスタムページ編集API
        def edit_custom_page_design(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/editCustomPageDesign", Yahoo::Api.access_token ,opts, "xml")
        end

        # カスタムページ参照API
        def get_custom_page_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getCustomPageDesign", Yahoo::Api.merge_pro(opts), "xml")
        end

        # カスタムページ削除API
        def delete_custom_page(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteCustomPage",Yahoo::Api.access_token ,opts,"xml")
        end

        # ストア設定フリースペース参照API
        def get_storeinfo_freespace(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStoreinfoFreespace", Yahoo::Api.merge_pro(opts), "xml")
        end

        # ストア設定フリースペース編集API
        def set_storeinfo_freespace(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStoreinfoFreespace", Yahoo::Api.access_token ,opts,"xml")
        end

      end

    end

  end

end
