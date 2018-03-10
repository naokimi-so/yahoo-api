module Yahoo

  class Api

    class Shp

      GetShopCategory = "Yahoo::Api::Shp.get_shop_category"
      GetShopCategoryList = "Yahoo::Api::Shp.get_shop_category_list"
      DownloadShopCategories = "Yahoo::Api::Shp.download_shop_categories"
      GetShopBrandList = "Yahoo::Api::Shp.get_shop_brand_list"
      DownloadShopBrands = "Yahoo::Api::Shp.download_shop_brands"


      class << self

        def get_shop_category(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getShopCategory", Yahoo::Api.merge_pro(opts), "xml")
        end

        def get_shop_category_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getShopCategoryList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def download_shop_categories(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/downloadShopCategories", Yahoo::Api.merge_pro(opts), "xml")
        end

        def get_shop_brand_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getShopBrandList", Yahoo::Api.merge_pro(opts), "xml")
        end

        def download_shop_brands(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/downloadShopBrands", Yahoo::Api.merge_pro(opts), "xml")
        end
      end

    end

  end

end
