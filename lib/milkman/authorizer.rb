module Milkman
  class Authorizer

    include Utility

    attr_accessor :options, :shared_secret

    def initialize(attributes)
      @shared_secret = attributes.delete(:shared_secret)
      @options       = attributes.merge! default_options
    end

    def self.authorize(options)
      new(options).authorize
    end

    def authorize
      puts I18n.t("milkman.authorization.frob_message", url: frob_message_url)
      puts I18n.t("milkman.authorization.auth_token_message", username: response["rsp"]["auth"]["user"]["username"], api_key: options[:api_key], shared_secret: shared_secret, auth_token: response["rsp"]["auth"]["token"])
    end

    private

    def response
      @response ||= Milkman::Request.call request_url(signed_options)
    end

    def signed_options
      sign shared_secret, options.merge!(method: "rtm.auth.getToken", frob: frob)
    end

    def frob
      STDIN.gets.strip
    end

    def frob_message_url
      authorization_url sign(shared_secret,  options.reject {|key,value| key == :format} )
    end

    def authorization_url(parameters)
      [ AUTH_URL, encode(parameters) ].join "?"
    end

  end
end
