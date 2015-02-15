module Smartdc::Api
  module Machines::Snapshots
    def machine_snapshots(machine_id, params={})
      get 'my/machines/' + machine_id.to_s + '/snapshots', params
    end

    def create_machine_snapshot(machine_id, body={})
      post 'my/machines/' + machine_id.to_s + '/snapshots', body
    end

    def machine_snapshot(machine_id, name)
      get 'my/machines/' + machine_id.to_s + '/snapshots/' + name.to_s
    end

    def destroy_machine_snapshot(machine_id, name)
      delete 'my/machines/' + machine_id.to_s + '/snapshots/' + name.to_s
    end

    def start_machine_snapshot(machine_id, name)
      post 'my/machines/' + machine_id.to_s + '/snapshots/' + name.to_s, {}
    end
  end
end
