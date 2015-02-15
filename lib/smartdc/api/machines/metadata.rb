module Smartdc::Api
  module Machines::Metadata
    def machine_metadata(machine_id, params={})
      get 'my/machines/' + machine_id.to_s + '/metadata', params
    end

    def update_machine_metadata(machine_id, body={})
      post 'my/machines/' + machine_id.to_s + '/metadata', body
    end

    def destroy_machine_metadata(machine_id, key)
      delete 'my/machines/' + machine_id.to_s + '/metadata/' + key.to_s
    end
  end
end
