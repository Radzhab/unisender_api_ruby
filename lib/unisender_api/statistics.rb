class Statistics
  attr_accessor :api

  def initialize(api)
      self.api = api
  end

  def getCampaignDeliveryStats(campaign_id, changed_since = '', field_ids = '')
      param = Hash.new
      param.merge!(self.api.gen_hash(campaign_id, 'campaign_id'))
      param.merge!(self.api.gen_hash(changed_since, 'changed_since')) if changed_since != ''
      param.merge!(self.api.gen_hash(field_ids, 'field_ids')) if field_ids != ''
      self.api.api_call('getCampaignDeliveryStats', param)
  end

  def getCampaignAggregateStats(campaign_id)
      param = Hash.new
      param.merge!(self.api.gen_hash(campaign_id, 'campaign_id'))
      self.api.api_call('getCampaignDeliveryStats', param)
  end

  def getVisitedLinks(campaign_id, group = false)
      param = Hash.new
      param.merge!(self.api.gen_hash(campaign_id, 'campaign_id'))
      param.merge!(self.api.gen_hash(group, 'group'))
      self.api.api_call('getVisitedLinks', param)
  end

end
