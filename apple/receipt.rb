require "json"
require "httparty"

class Apple::Receipt
  def initialize(receipt: nil, password: nil)
    production = "https://itunes.apple.com/verifyReceipt"
    staging    = "https://sandbox.itunes.apple.com/verifyReceipt"
    @url       = Rails.env.production? ? production : staging
    @receipt   = receipt
    @password  = password
  end

  def verify
    body = {
      "receipt-data": @receipt,
      "password": @password,
      "exclude-old-transaction": @old_transaction
    }
    headers  = { "Accept": "application/json", "Content-Type": "application/json" }
    response = HTTParty.post(@url, body: body.to_json, headers: headers)

    return JSON.parse(response.body)
  end
end
