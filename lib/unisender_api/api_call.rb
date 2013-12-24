class ApiCall
    attr_accessor :api_key, :test, :url
    
    def initialize(api_key, locale = 'en', test = false)
      self.api_key = api_key
      self.test = test
      self.url = "http://api.unisender.com/#{locale}/api/"
    end


    def api_call(method, params)
      url = self.url + method
      params.merge!(:test_mode => '1') if self.test
      params.merge!(:api_key => self.api_key)
      result = JSON.parse(self.post(url, params))
      return result
    end


    def gen_hash(param, label)
      hash = Hash.new
      
      
      case param
      when Time
        hash.merge!("#{label}" => param.strftime("%F %H:%M"))
      when Boolean
        hash.merge!("#{label}" => param.to_s)
      when String
        hash.merge!("#{label}" => param.to_s)
      when Fixnum
        hash.merge!("#{label}" => param.to_s)
      when Bignum
        hash.merge!("#{label}" => param.to_s)
      when Float
        hash.merge!("#{label}" => param.to_s)
      when Hash
        param.each do |key, value|
          hash.merge!(self.gen_hash(value,"#{label}[#{key}]"))
        end
      when Array
        i = 0
        array.each do |value|
          hash.merge!(self.gen_hash(value, "#{label}[#{i}]"))
          i = i+1
        end
      end
      return hash
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
