require 'rest-client'
require "json"

module Validators
  class Email

    def initialize(email)
      @email = email
    end

    def validate
      url = "https://apilayer.net/api/check"
      response = RestClient.get(url, {params: {
        access_key: Rails.application.credentials.mail_box_layer,
        email: @email}
        })
      return JSON.parse(response)
    end
  end
end
