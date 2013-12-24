# UnisenderApi

Unisender API integration. Ruby gem

## Installation

Add this line to your application's Gemfile:

    gem 'unisender_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unisender_api

## Usage

##How to use?

###1. Create your ruby project

###2. Add "require 'unisender_api'"

###3. Create class
```ruby
  api = Unisender::API.new(api_key, locale, test_mode)
```
```
  api_key - your api key from unisender
  locale - unisender locale 'en' by default. Optional
  test_mode - on/off (true/false) test mode, false (off) by default. Optional
```
###4. Accepted class in methods
```
  Time
  Boolean
  String
  Fixnum
  Bignum
  Float
  Hash - for multi attach emails and other
  Array - for multi adress email and other
```

###5. Methods structure

####Unisender::API.lists
  
  getLists - return exists lists
  
  createList(title, before_subscribe_url = '', after_subscribe_url = '')

  updateList(list_id, title, before_subscribe_url = '', after_subscribe_url = '')

  deleteList(list_id)

  subscribe(list_ids, fields, tags = '', request_ip = '', request_time = '', double_optin = '', confirm_ip = '', confirm_time = '', overwrite = '')

  importContacts(field_names = 'email', data = 'a@example.com', double_optin = 0, overwrite_tags = 0, overwrite_lists = 0, force_import = 0)
  
  example:
```
    Unisender::API.new(key).lists.importContacts(['email', 'email_list_ids'], [['a@example.com', '1'],['b@example.com', '2']])
```
  or:
```
    Unisender::API.new(key).lists.importContacts({0 => 'email', 1 => 'email_list_ids'}, {'[0][0]' => 'a@example.com', '[0][1]' => '1'})
```
  exportContacts(list_id, field_names = ['email'], offset = 0, tag = '', email = '', email_status = '', phone = '', phone_status = '', limit = 1000)
  similar to importContacts
####Unisender::API.messages

  createEmailMessage(sender_name, sender_email, subject, body, list_id, text_body = '', generate_text = 0, tag = '', attachments = {}, lang = 'en', series_day = '', series_time = '', wrap_type = 'skip', caregories = '')

#####Note: attachments is hash { :file_name1 => content1, :file_name2 => content2 }

  createSmsMessage(sender, body, list_id, tag = '', series_day = '', series_time = '', categories = '')

  createCampaign(message_id, start_time = '', timezone = '', track_read = 0, track_links = 0, contacts = '', contacts_url = '', defer = 1, track_ga = 0, payment_limit = 0, payment_currency = '', ga_medium = '', ga_source ='', ga_campaign = '', ga_content = '', ga_term = '')

  getCampaigns(from = '', to = '')

  getCampaignStatus(campaign_id)

  sendSms(phone, sender, text)

  sendEmail(email, sender_name, sender_email, subject, body, list_id, user_campaign_id, attachments, lang ='en', track_read = 0,track_links = 0, cc = '', headers = '', wrap_type = 'skip', images_as = 'attachments', error_checking = 0)

#####Note: field attach_multi is automatic selectable
#####Note: attachments if one set for all attachments = { :filename1 => content1} else attachments = [{:filename1 => content1}, {:filename2 => content}]

  checkEmail(email_id)

  updateOptInEmail(sender_name, sender_email, subject, body, list_id)

  deleteMessage(message_id)

####Unisender::API.statistics
  
  getCampaignDeliveryStats(campaign_id, changed_since = '', field_ids = '')

  getCampaignAggregateStats(campaign_id)

  getVisitedLinks(campaign_id, group = false)

####Unisender::API.extends

  getFields

  createField(name, type, is_visible = 1, view_pos = 1)

  updateField(id, name = '', type = '', is_visible = 1, view_pos = 1)

  getTags

  deleteTag(id)

####Unisender::API.partners

  validateSender(email, login = '')

  register(email, login, password = '', notify = 0, extra = {}, timezone = '', country_code = 'RUS', currency_code = 'RUB', ip = '', api_mode = 'on')

  checkUserExists(login = '', email = '')

  getUserInfo(login)

  getUsers(register_after = '', register_before = '')

  transferMoney(source_login, target_login, sum, currency)

  getPayments(login = '', from = '', to = '', only_real_deposit = 0, ids = '', comment_substrings = [], payment_type = '')

  getTariffs

  changeTariff(login, tariff_id)

## More API Info
For more information about actions and returned answers please visit: http://www.unisender.com/help/api/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
