module Yahoo

  class Api

    class StCategory

      GetStCategory = "Yahoo::Api::StCategory.get_st_category"
      StCategoryList = "Yahoo::Api::StCategory.st_category_list"

      class << self

        def get_st_category(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStCategory", Yahoo::Api.merge_pro(opts), "xml")
        end

        def st_category_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/stCategoryList", Yahoo::Api.merge_pro(opts), "xml")
        end

      end

    end

  end

end
