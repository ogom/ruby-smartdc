module Smartdc::Api
  module Machines::Tags
    def machine_tags(machine_id, params={})
      get 'my/machines/' + machine_id.to_s + '/tags', params
    end

    def create_machine_tag(machine_id, body={})
      post 'my/machines/' + machine_id.to_s + '/tags', body
    end

    def machine_tag(machine_id, key)
      get 'my/machines/' + machine_id.to_s + '/tags/' + key.to_s
    end

    def destroy_machine_tag(machine_id, key)
      delete 'my/machines/' + machine_id.to_s + '/tags/' + key.to_s
    end
  end
end
