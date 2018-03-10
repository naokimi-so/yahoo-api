module Yahoo

  class Api

    class StCategory

      EditStCategory = "Yahoo::Api::StCategory.edit_st_category"
      GetStCategory = "Yahoo::Api::StCategory.get_st_category"
      StCategoryList = "Yahoo::Api::StCategory.st_category_list"
      MoveStCategory = "Yahoo::Api::StCategory.move_st_category"
      DeleteStCategory = "Yahoo::Api::StCategory.delete_st_category"
      SortCategories = "Yahoo::Api::StCategory.sort_categories"

      class << self

        # ストアカテゴリ編集API
        def edit_st_category(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/editStCategory", Yahoo::Api.access_token ,opts, "xml")
        end

        # ストアカテゴリ参照API
        def get_st_category(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStCategory", Yahoo::Api.merge_pro(opts), "xml")
        end

        # ストアカテゴリ一覧API
        def st_category_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/stCategoryList", Yahoo::Api.merge_pro(opts), "xml")
        end

        # ストアカテゴリ移動API
        def move_st_category(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/moveStCategory", Yahoo::Api.access_token ,opts, "xml")
        end

        # ストアカテゴリ削除API
        def delete_st_category(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteStCategory", Yahoo::Api.access_token ,opts, "xml")
        end

        # ストアカテゴリ表示順序変更API
        def sort_categories(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/sortCategories", Yahoo::Api.access_token ,opts, "xml")
        end

      end

    end

  end

end
