class Google::Product < Google::Based
  def initialize(package_name: nil, product_id: nil, purchase_token: nil)
    @token        = purchase_token
    @product_id   = product_id
    @package_name = package_name
  end

  def acknowledge
    response = AndroidPublisher.acknowledge_purchase_product(
      @package_name, @product_id, @token
    )

    return response
  end

  def consume
    base     = "https://androidpublisher.googleapis.com/androidpublisher/v3/applications"
    product  = "#{@package_name}/purchases/products"
    url      = "#{base}/#{product}/#{@product_id}/tokens/#{@token}:consume"
    headers  = { "Authorization": "Bearer #{Authorizer.fetch_access_token!}" }
    response = HTTParty.post(url, headers: headers)

    return JSON.parse(response.body)
  end

  def get
    response = AndroidPublisher.get_purchase_product(
      @package_name, @product_id, @token
    )

    return response
  end
end
