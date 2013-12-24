class Lists
 attr_accessor :api

  def initialize(api)
    self.api = api
  end

  def getLists
    self.api.api_call('getLists', {})
  end

  def createList(title, before_subscribe_url = '', after_subscribe_url = '')
    param = Hash.new
    param.merge!(self.api.gen_hash(title, 'title'))
    param.merge!(self.api.gen_hash(before_subscribe_url,'before_subscribe_url')) if before_subscribe_url != ''
    peram.merge!(self.api.gen_hash(after_subscribe_url, 'after_subscribe_url')) if after_subscribe_url != ''
    self.api.api_call('createList', param)
  end

  def updateList(list_id, title, before_subscribe_url = '', after_subscribe_url = '')
    param = Hash.new
    param.merge!(self.api.gen_hash(list_id, 'list_id'))
    param.merge!(self.api.gen_hash(title, 'title'))
    param.merge!(self.api.gen_hash(before_subscirbe_url, 'before_subscribe_url')) if before_subscribe_url != ''
    param.merge!(self.api.gen_hash(after_subscribe_url, 'after_subscribe_url')) if after_subscribe_url != ''
    self.api.api_call('updateList', param)
  end

  def deleteList(list_id)
    param = Hash.new
    param.merge!(self.api.gen_hash(list_id, 'list_id'))
    self.api.api_call('deleteList', param)
  end

  def subscribe(list_ids, fields, tags = '', request_ip = '', request_time = '', double_optin = '', confirm_ip = '', confirm_time = '', overwrite = '')
    param = Hash.new
    param.merge!(self.api.gen_hash(list_ids, 'list_ids'))
    param.merge!(self.api.gen_hash(fields, 'fields'))
    param.merge!(self.api.gen_hash(tags, 'tags')) if tags != ''
    param.merge!(self.api.gen_hash(request_ip, 'request_ip')) if request_ip != ''
    param.merge!(self.api.gen_hash(request_time, 'request_time')) if request_time != ''
    param.merge!(self.api.gen_hash(double_optin, 'double_optin')) if double_optin != ''
    param.merge!(self.api.gen_hash(confirm_ip, 'confirm_ip')) if confirm_ip != ''
    param.merge!(self.api.gen_hash(confirm_time, 'confirm_time')) if confirm_time != ''
    param.merge!(self.api.gen_hash(overwrite, 'overwrite')) if overwrite != ''
    self.api.api_call('subscribe', param)
  end

  def importContacts(field_names = 'email', data = 'a@example.com', double_optin = 0, overwrite_tags = 0, overwrite_lists = 0, force_import = 0)
    param = Hash.new
    param.merge!(self.api.gen_hash(field_names, 'field_names'))
    param.merge!(self.api.gen_hash(data, 'data'))
    param.merge!(self.api.gen_hash(double_optin, 'double_optin'))
    param.merge!(self.api.gen_hash(overwrite_tags, 'overwrite_tags'))
    param.merge!(self.api.gen_hash(overwrite_lists, 'overwrite_lists'))
    param.merge!(self.api.gen_hash(force_import, 'force_import'))
    self.api.api_call('importContacts', param)
  end

  def exportContacts(list_id, field_names = ['email'], offset = 0, tag = '', email = '', email_status = '', phone = '', phone_status = '', limit = 1000)
    param = Hash.new
    param.merge!(self.api.gen_hash(list_id, 'list_id'))
    param.merge!(self.api.gen_hash(field_names, 'field_names'))
    param.merge!(self.api.gen_hash(offset, 'offset'))
    param.merge!(self.api.gen_hash(tag, 'tag')) if tag != ''
    param.merge!(self.api.gen_hash(email, 'email')) if email != ''
    param.merge!(self.api.gen_hash(email_status, 'email_status')) if email_status != ''
    param.merge!(self.api.gen_hash(phone, 'phone')) if phone != ''
    param.merge!(self.api.gen_hash(phone_status, 'phone_status')) if phone_status != ''
    param.merge!(self.api.gen_hash(limit, 'limit'))
    self.api.api_call('exportContacts', param)
  end


end
