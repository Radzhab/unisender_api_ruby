require "unisender_api/version"

module Unisender
 
  
  class Api
    attr_accessor :api_key, :test, :url
    
    def initialize(api_key, locale = 'en', test = false)
      self.api_key = api_key
      self.test = test
      self.url = "http://api.unisender.com/#{self.locale}/api/"
    end


    def api_call(method, params)
      url = self.url + method
      params.merge!(:test_mode => '1') if self.test
      params.merge!(:api_key => self.api_key)
      result = JSON.parse(self.post(url, params))
      return result
    end
    
    def post(url, param)
       uri = URI.parse(url)
       https = Net::HTTP.new(uri.host, uri.port)
       https.use_ssl = true
       params = Addressable::URI.new
       params.query_values = param
       https.post(uri.path, params.query).body
    end

 end
end
