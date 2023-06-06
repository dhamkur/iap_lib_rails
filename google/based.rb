require "pry"
require "json"
require "httparty"
require "googleauth"
require "google/apis/androidpublisher_v3"

class Google::Based
  Authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
    json_key_io: File.open("../../service-account.json"),
    scope: "https://www.googleapis.com/auth/androidpublisher"
  )
  AndroidPublisher = Google::Apis::AndroidpublisherV3::AndroidPublisherService.new
  AndroidPublisher.authorization = Authorizer
end
