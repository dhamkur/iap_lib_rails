class Google::Purchase::Subscription < Google::Based
  def initialize(package_name: nil, subscription_id: nil, purchase_token: nil)
    @token           = purchase_token
    @package_name    = package_name
    @subscription_id = subscription_id
  end

  def acknowledge
    response = AndroidPublisher.acknowledge_purchase_subscription(
      @package_name, @subscription_id, @token
    )

    return response
  end

  def get
    response = AndroidPublisher.get_purchase_subscription(
      @package_name, @subscription_id, @token
    )

    return response
  end
end
