require 'faraday'
require 'open-uri'
require 'date'

module Yahoo

  class Request

    def self.get(path,opts,format="json")
      uri = URI.parse("#{path}?#{opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}")
      Yahoo::Response.new(Net::HTTP.get_response(uri),format)
    end

    def self.file_get(path,opts,format="json")
      url = "#{path}?#{opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')}"
      url
    end

    def self.post(path,access_token,opts,format="json")
      conn = Faraday.new(:url => path) do |c|
        c.adapter Faraday.default_adapter
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post {|req| req.body = opts.map {|k,v|"#{k}=#{CGI.escape(v)}"}.join('&')},format)
    end

    def self.post_file(path,access_token,opts,format="json")
      conn = Faraday.new(:url => "#{path}?seller_id=#{opts[:seller_id]}") do |c|
        c.request :multipart
        c.request :url_encoded
        c.adapter :net_http
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post { |req|
        req.body = {
          file: Faraday::UploadIO.new(opts[:file_path], opts[:file_type], opts[:file_name])
        }
      },format)
    end

    def self.post_csv(path,access_token,opts,format="json")
      conn = Faraday.new(:url => "#{path}?seller_id=#{opts[:seller_id]}") do |c|
        c.request :multipart
        c.request :url_encoded
        c.adapter :net_http
        c.headers['Authorization'] = "Bearer " + access_token
      end
      Yahoo::Response.new(conn.post { |req|
        req.body = {
          file: Faraday::UploadIO.new(opts[:file_path], opts[:file_type], opts[:file_name]),
          type: opts[:type]
        }
      },format)
    end

    def self.post_xml_list(path, access_token, opts, format="json")
      today = Date.today + 1
      today_changed_format = today.strftime("%Y%m%d%H%M%S")
      daysAgo = today - 7
      daysAgo_changed_format = daysAgo.strftime("%Y%m%d%H%M%S")

      uri = URI.parse(path)
      response = nil
      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "text/xml;charset=UTF-8"
      request["Authorization"] = "Bearer " + access_token
      xml = \
        "<?xml version='1.0' encoding='UTF-8'?>
        <Req>
          <Search>
            <Result>9999</Result>
            <Start>1</Start>
            <Sort>-order_time</Sort>
            <Condition>
              <OrderTimeFrom>#{daysAgo_changed_format}</OrderTimeFrom>
              <OrderTimeTo>#{today_changed_format}</OrderTimeTo>
            </Condition>
            <Field>OrderId,Version</Field>
          </Search>
          <SellerId>#{opts[:seller_id]}</SellerId>
        </Req>"
      request.body = xml
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      key_path = Rails.root.to_s + "/public/play-smart.key"      
      cert_path = Rails.root.to_s + "/public/SHP-play-smart.crt"
      http.key = OpenSSL::PKey::RSA.new(File.read(key_path))
      http.cert = OpenSSL::X509::Certificate.new(File.read(cert_path))
      http.set_debug_output $stderr
      http.start do |h|
        response = h.request(request)
      end
      item = Hash.from_xml(response.body)
      item["Result"]["Search"]["OrderInfo"]
      # エラーの場合の処理。ステータスは以下
      # item["Result"]["Status"] = "NG"
    end

    def self.post_xml_info(path, access_token, opts, format="json")
      uri = URI.parse(path)
      response = nil
      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "text/xml;charset=UTF-8"
      request["Authorization"] = "Bearer " + access_token
      xml = \
        "<?xml version='1.0' encoding='UTF-8'?>
        <Req>
          <Target>
            <OrderId>#{opts[:order_id]}</OrderId>
            <Field>#{set_order_info_list}</Field>
          </Target>
          <SellerId>#{opts[:seller_id]}</SellerId>
        </Req>"
      request.body = xml
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      key_path = Rails.root.to_s + "/public/play-smart.key"      
      cert_path = Rails.root.to_s + "/public/SHP-play-smart.crt"
      http.key = OpenSSL::PKey::RSA.new(File.read(key_path))
      http.cert = OpenSSL::X509::Certificate.new(File.read(cert_path))
      http.set_debug_output $stderr
      http.start do |h|
        response = h.request(request)
      end
      item = Hash.from_xml(response.body)
      item["ResultSet"]["Result"]["OrderInfo"]
      # エラーの場合の処理。ステータスは以下
      # item["ResultSet"]["Result"]["Status"] = "NG"
    end

    def self.set_order_info_list
      "OrderId,ParentOrderId,ChildOrderId,IsSeen,CancelReason,CancelReasonDetail,IsAffiliate,OrderTime,LastUpdateTime,Suspect,OrderStatus,SendConfirmTime,SendPayTime,PrintSlipTime,PrintDeliveryTime,PrintBillTime,Notes,OperationUser,Referer,EntryPoint,UsageId,UseCouponData,TotalCouponDiscount,ShippingCouponFlg,ShippingCouponDiscount,CampaignPoints,IsMultiShip,MultiShipId,PayStatus,SettleStatus,PayType,PayKind,PayMethod,PayMethodName,SellerHandlingCharge,PayActionTime,PayDate,PayNotes,SettleId,CardBrand,CardNumber,CardNumberLast4,CardExpireYear,CardExpireMonth,CardPayType,CardHolderName,CardPayCount,CardBirthDay,UseYahooCard,UseWallet,NeedBillSlip,NeedDetailedSlip,NeedReceipt,BillAddressFrom,BillFirstName,BillFirstNameKana,BillLastName,BillLastNameKana,BillZipCode,BillPrefecture,BillPrefectureKana,BillCity,BillCityKana,BillAddress1,BillAddress2,BillPhoneNumber,BillEmgPhoneNumber,BillMailAddress,BillSection1Field,BillSection1Value,BillSection2Field,BillSection2Value,PayNo,PayNoIssueDate,ConfirmNumber,IsApplePay,ShipStatus,ShipMethod,ShipMethodName,ShipRequestDate,ShipRequestTime,ShipNotes,ShipCompanyCode,ShipInvoiceNumber1,ShipInvoiceNumber2,ShipDate,ArrivalDate,NeedGiftWrap,GiftWrapType,GiftWrapMessage,NeedGiftWrapPaper,ShipFirstName,ShipFirstNameKana,ShipLastName,ShipLastNameKana,ShipZipCode,ShipPrefecture,ShipPrefectureKana,ShipCity,ShipCityKana,ShipAddress1,ShipAddress2,ShipPhoneNumber,ShipEmgPhoneNumber,ShipSection1Field,ShipSection1Value,ShipSection2Field,ShipSection2Value,PayCharge,ShipCharge,GiftWrapCharge,Discount,Adjustments,SettleAmount,UsePoint,TotalPrice,SettlePayAmount,TaxRatio,IsGetPointFixAll,TotalMallCouponDiscount,LineId,ItemId,Title,SubCode,SubCodeOption,ItemOption,Inscription,ImageId,IsTaxable,Jan,ProductId,CategoryId,AffiliateRatio,UnitPrice,Quantity,PointAvailQuantity,PointFspCode,PointRatioY,PointRatioSeller,UnitGetPoint,CouponData,CouponDiscount,CouponUseNum,OriginalPrice,OriginalNum,LeadTimeStart,LeadTimeEnd,GuestAuthId"
    end

  end

end
