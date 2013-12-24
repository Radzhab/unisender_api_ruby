class Extends
  attr_accessor :api

    def initialize(api)
        self.api = api
    end

    def getFielda
        self.api.api_call('getFields', {})
    end

    def createField(name, type, is_visible = 1, view_pos = 1)
        param = Hash.new
        param.merge!(self.api.gen_hash(name, 'name'))
        param.merge!(self.api.gen_hash(type, 'type'))
        param.merge!(self.api.gen_hash(is_visible, 'is_visible'))
        param.merge!(self.api.gen_hash(view_pos))
        self.api.api_call('createField', param)
    end

    def updateField(id, name = '', type = '', is_visible = 1, view_pos = 1)
        param = Hash.new
        param.merge!(self.api.gen_hash(id, 'id'))
        param.merge!(self.api.gen_hash(name, 'name')) if name != ''
        param.merge!(self.api.gen_hash(type, 'type')) if type != ''
        param.merge!(self.api.gen_hash(is_visible, 'is_visible'))
        param.merge!(self.api.gen_hash(view_pos, 'view_pos'))
        self.api.api_call('updateField', param)
    end

    def getTags
        self.api.api_call('getTags', {})
    end

    def deleteTag(id)
        param = Hash.new
        param.merge!(self.api.gen_hash(id, 'id'))
        self.api.api_call('deleteTag', param)
    end

end
