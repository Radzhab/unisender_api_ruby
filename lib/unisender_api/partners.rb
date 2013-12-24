class Partners
  attr_accessor :api
  
  def initialize(api)
      self.api = api
  end

  def validateSender(email, login = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(email, 'email'))
      param.merge!(self.api.gen_hash(login, 'login')) if login != ''
      self.api.api_call('validateSender', param)
  end

  def register(email, login, password = '', notify = 0, extra = {}, timezone = '', country_code = 'RUS', currency_code = 'RUB', ip = '', api_mode = 'on')
      param = Hash.new
      param.merge!(self.api.gen_hash(email, 'email'))
      param.merge!(self.api.gen_hash(login, 'login'))
      param.merge!(self.api.gen_hash(password, 'password')) if password != ''
      param.merge!(self.api.gen_hash(notify, 'notify'))
      param.merge!(self.api.gen_hash(extra, 'extra')) unless extra.empty?
      param.merge!(self.api.gen_hash(timezone, 'timezone')) if timezone != ''
      param.merge!(self.api.gen_hash(country_code, 'country_code'))
      param.merge!(self.api.gen_hash(currency_code, 'currence_code'))
      param.merge!(self.api.gen_hash(ip, 'ip')) if ip != ''
      param.merge!(self.api.gen_hash(api_mode, 'api_mode'))
      self.api.api_call('register', param)
  end

  def checkUserExists(login = '', email = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(login, 'login')) if login != ''
      param.merge!(self.api.gen_hash(email, 'email')) if email != ''
      self.api.api_call('checkUserExists', param)
  end

  def getUserInfo(login)
      param = Hash.new
      param.merge!(self.api.gen_hash(login, 'login'))
      self.api.api_call('getUserInfo', param)
  end

  def getUsers(register_after = '', register_before = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(register_after, 'register_after')) if register_after != ''
      param.merge!(self.api.gen_hash(register_before, 'register_before')) if register_before != ''
      self.api.api_call('getUsers', param)
  end

  def transferMoney(source_login, target_login, sum, currency)
      param = Hash.new
      param.merge!(self.api.gen_hash(source_login, 'source_login'))
      param.merge!(self.api.gen_hash(target_login, 'target_login'))
      param.merge!(self.api.gen_hash(sum, 'sum'))
      param.merge!(self.api.gen_hash(currency, 'currency'))
      self.api.api_call('transferMoney', param)
  end

  def getPayments(login = '', from = '', to = '', only_real_deposit = 0, ids = '', comment_substrings = [], payment_type = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(login, 'login')) if login != ''
      param.merge!(self.api.gen_hash(from, 'from')) if from != ''
      param.merge!(self.api.gen_hash(to, 'to')) if to != ''
      param.merge!(self.api.gen_hash(only_real_deposit, 'only_real_deposit'))
      param.merge!(self.api.gen_hash(ids, 'ids')) if ids != ''
      param.merge!(self.api.gen_hash(comment_substrings, 'comment_substrings')) unless comment_substrings.empty?
      param.merge!(self.api.gen_hash(payment_type, 'payment_type')) if payment_type != ''
      self.api.api_call('getPayments', param)
  end

  def getTariffs
      self.api.api_call('getTariffs', {})
  end

  def changeTariff(login, tariff_id)
      param = Hash.new
      param.merge!(self.api.gen_hash(login, 'login'))
      param.merge!(self.api.gen_hash(tariff_id, 'tarrif_id'))
      self.api.api_call('changeTariff', param)
  end

end
