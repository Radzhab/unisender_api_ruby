class Messages
  attr_accessor :api

    def initialize(api)
      self.api = api
    end

    def createEmailMessage(sender_name, sender_email, subject, body, list_id, text_body = '', generate_text = 0, tag = '', attachments = {}, lang = 'en', series_day = '', series_time = '', wrap_type = 'skip', categories = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(sender_name, 'sender_name'))
      param.merge!(self.api.gen_hash(sender_email, 'sender_email'))
      param.merge!(self.api.gen_hash(subject, 'subject'))
      param.merge!(self.api.gen_hash(body, 'body'))
      param.merge!(self.api.gen_hash(list_id, 'list_id'))
      param.merge!(self.api.gen_hash(text_body, 'text_body')) if text_body != ''
      param.merge!(self.api.gen_hash(generate_text, 'generate_text'))
      param.merge!(self.api.gen_hash(tag, 'tag')) if tag != ''
      if !attachments.empty?
          param.merge!(self.api.gen_hash(arrachments, 'attachments'))
      end
      param.merge!(self.api.gen_hash(lang, 'lang'))
      param.merge!(self.api.gen_hash(series_day, 'series_day')) if series_day != ''
      param.merge!(self.api.gen_hash(series_time, 'series_time')) if series_time != ''
      param.merge!(self.api.gen_hash(wrap_type, 'wrap_type'))
      param.merge!(self.api.gen_hash(categories, 'categories')) if categories != ''
      self.api.api_call('createEmailMessage', param)
    end

    def createSmsMessage(sender, body, list_id, tag = '', series_day = '', series_time = '', categories = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(sender, 'sender'))
      param.merge!(self.api.gen_hash(body, 'body'))
      param.merge!(self.api.gen_hash(list_id, 'list_id'))
      param.merge!(self.api.gen_hash(tag, 'tag')) if tag != ''
      param.merge!(self.api.gen_hash(series_day, 'series_day')) if series_day != ''
      param.merge!(self.api.gen_hash(series_time, 'series_time')) if series_time != ''
      param.merge!(self.api.gen_hash(categories, 'categories')) if categories != ''
      self.api.api_call('createSmsMessage', param)
    end

    def createCampaign(message_id, start_time = '', timezone = '', track_read = 0, track_links = 0, contacts = '', contacts_url = '', defer = 1, track_ga = 0, payment_limit = 0, payment_currency = '', ga_medium = '', ga_source ='', ga_campaign = '', ga_content = '', ga_term = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(message_id, 'message_id'))
      param.merge!(self.api.gen_hash(start_time, 'start_time')) if start_time != ''
      param.merge!(self.api.gen_hash(timezone, 'timezone')) if timezone != ''
      param.merge!(self.api.gen_hash(track_read, 'track_read'))
      param.merge!(self.api.gen_hash(track_links, 'track_links'))
      param.merge!(self.api.gen_hash(contacts, 'contacts')) if contacts != ''
      param.merge!(self.api.gen_hash(contacts_url, 'contacts_url')) if contacts_url != ''
      param.merge!(self.api.gen_hash(defer, 'defer'))
      param.merge!(self.api.gen_hash(track_ga, 'track_ga.to_s'))
      param.merge!(self.api.gen_hash(payment_limit, 'payment_limit'))
      param.merge!(self.api.gen_hash(payment_currency, 'payment_currency')) if payment_currency != ''
      param.merge!(self.api.gen_hash(ga_medium, 'ga_medium')) if ga_medium != ''
      param.merge!(self.api.gen_hash(ga_source, 'ga_source')) if ga_source != ''
      param.merge!(self.api.gen_hash(ga_campaign, 'ga_campaign')) if ga_campaign != ''
      param.merge!(self.api.gen_hash(ga_content, 'ga_content')) if ga_content != ''
      param.merge!(self.api.gen_hash(ga_term, 'ga_term')) if ga_term != ''
      self.api.api_call('createCampaign', param)
    end

    def getCampaigns(from = '', to = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(from, 'from')) if from != ''
      param.merge!(self.api.gen_hash(to, 'to')) if to != ''
      self.api.api_call('getCampaigns', param)
    end

    def getCampaignStatus(campaign_id)
      param = Hash.new
      param.merge!(self.api.gen_hash(campaign_id, 'campaign_id'))
      self.api.api_call('getCampaignStatus', param)
    end

    def sendSms(phone, sender, text)
      param = Hash.new
      param.merge!(self.api.gen_hash(phone, 'phone'))
      param.merge!(self.api.gen_hash(sender, 'sender'))
      param.merge!(self.api.gen_hash(text, 'text'))
      self.api.api_call('sendSms', param)
    end

    def checkSms(sms_id)
      param = Hash.new
      param.merge!(self.api.gen_hash(sms_id, 'sms_id'))
      self.api.api_call('checkSms', param)
    end

    def sendEmail(email, sender_name, sender_email, subject, body, list_id, user_campaign_id, attachments, lang ='en', track_read = 0,track_links = 0, cc = '', headers = '', wrap_type = 'skip', images_as = 'attachments', error_checking = 0)
        param = Hash.new
        param.merge!(self.api.gen_hash(email, 'email'))
        param.merge!(self.api.gen_hash(sender_name, 'sender_name'))
        param.merge!(self.api.gen_hash(sender_email, 'sender_email'))
        param.merge!(self.api.gen_hash(subject, 'subject'))
        param.merge!(self.api.gen_hash(body, 'body'))
        param.merge!(self.api.gen_hash(list_id, 'list_id'))
        param.merge!(self.api.gen_hash(user_campaign_id, 'user_campaign_id'))
        param.merge!(:attach_multi => '1') if attachments.is_a? Array
        param.merge!(self.api.gen_hash(attachments, 'attachments'))
        param.merge!(self.api.gen_hash(lang, 'lang'))
        param.merge!(self.api.gen_hash(track_read, 'track_read'))
        param.merge!(self.api.gen_hash(track_links, 'track_links'))
        param.merge!(self.api.gen_hash(cc, 'cc')) if cc != ''
        param.merge!(self.api.gen_hash(headers, 'headers')) if headers != ''
        param.merge!(self.api.gen_hash(wrap_type, 'wrap_type'))
        param.merge!(self.api.gen_hash(images_as, 'images_as'))
        param.merge!(self.api.gen_hash(error_checking, 'error_checking'))
        self.api.api_call('sendEmail', param)
    end

    def checkEmail(email_id)
        param = Hash.new
        param.merge!(self.api.gen_hash(email_id, 'email_id'))
        self.api.api_call('checkEmail', param)
    end

    def updateOptInEmail(sender_name, sender_email, subject, body, list_id)
        param = Hash.new
        param.merge!(self.api.gen_hash(sender_name, 'sender_name'))
        param.merge!(self.api.gen_hash(sender_eamil, 'sender_email'))
        param.merge!(self.api.gen_hash(subject, 'subject'))
        param.merge!(self.api.gen_hash(body, 'body'))
        param.merge!(self.api.gen_hash(list_id, 'list_id'))
        self.api.api_call('updateOptInEmail', param)
    end

    def deleteMessage(message_id)
        param = Hash.new
        param.merge!(self.api.gen_hash(message_id, 'message_id'))
        self.api.api_call('deleteMessage', param)
    end

end
