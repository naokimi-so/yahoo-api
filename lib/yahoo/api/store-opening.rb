module Yahoo

  class Api

    class StoreOpening

      DataCheckHistorySummary = "Yahoo::Api::StoreOpening.data_check_history_summary"
      DataCheckHistoryDetail = "Yahoo::Api::StoreOpening.data_check_history_detail"
      PublishHistorySummary = "Yahoo::Api::StoreOpening.publish_history_summary"
      PublishHistoryDetail = "Yahoo::Api::StoreOpening.publish_history_detail"
      DownloadList = "Yahoo::Api::StoreOpening.download_list"
      DownloadSubmit = "Yahoo::Api::StoreOpening.download_submit"

      class << self

        # データチェック履歴一覧API
        def data_check_history_summary(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/dataCheckHistorySummary", Yahoo::Api.merge_pro(opts), "xml")
        end

        # データチェック履歴詳細API
        def data_check_history_detail(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/dataCheckHistoryDetail", Yahoo::Api.merge_pro(opts), "xml")
        end

        # 反映履歴/未反映項目一覧API
        def publish_history_summary(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/publishHistorySummary", Yahoo::Api.merge_pro(opts), "xml")
        end

        # 反映履歴/未反映項目詳細API
        def publish_history_detail(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/publishHistoryDetail", Yahoo::Api.merge_pro(opts), "xml")
        end

        # ダウンロード準備完了通知API
        def download_list(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/downloadList", Yahoo::Api.merge_pro(opts), "xml")
        end

        # ダウンロード実行API
        def download_submit(opts={})
          Yahoo::Request.get("https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/downloadSubmit", Yahoo::Api.merge_pro(opts), "xml")
        end

      end

    end

  end

end
