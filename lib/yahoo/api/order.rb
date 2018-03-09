module Yahoo

  class Api

    class Order

      OrderCount = "Yahoo::Api::Order.order_count"
      OrderList = "Yahoo::Api::Order.order_list"
      OrderInfo = "Yahoo::Api::Order.order_info"
      OrderStatusChange = "Yahoo::Api::Order.order_status_change"
      OrderPayStatusChange = "Yahoo::Api::Order.order_pay_status_change"
      OrderShipStatusChange = "Yahoo::Api::Order.order_ship_status_change"
      OrderChange = "Yahoo::Api::Order.order_change"
      OrderChangeHistory = "Yahoo::Api::Order.order_change_history"
      OrderItemAdd = "Yahoo::Api::Order.order_item_add"
      OrderPayNumber = "Yahoo::Api::Order.order_pay_number"
      OrderCouponCancel = "Yahoo::Api::Order.order_coupon_cancel"

      class << self

        def order_count(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderCount", Yahoo::Api.merge(opts), "xml")
        end

        def order_list(opts={})
          Yahoo::Request.post_xml_list("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderList", Yahoo::Api.access_token, opts, "xml")
        end

        def order_info(opts={})
          Yahoo::Request.post_xml_info("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderInfo", Yahoo::Api.access_token, opts, "xml")
        end

        def order_status_change(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderStatusChange", Yahoo::Api.access_token, opts, "xml")
        end

        def order_pay_status_change(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderPayStatusChange", Yahoo::Api.access_token, opts, "xml")
        end

        def order_ship_status_change(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderShipStatusChange", Yahoo::Api.access_token, opts, "xml")
        end

        def order_change(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderChange", Yahoo::Api.merge(opts), "xml")
        end

        def order_change_history(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderChangeHistory", Yahoo::Api.merge(opts), "xml")
        end

        def order_item_add(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderItemAdd", Yahoo::Api.access_token, opts, "xml")
        end

        def order_pay_number(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderPayNumber", Yahoo::Api.access_token, opts, "xml")
        end

        def order_coupon_cancel(opts={})
          Yahoo::Request.post("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderCouponCancel", Yahoo::Api.access_token, opts, "xml")
        end

      end

    end

  end

end
