module Smartdc::Api
  module Machines
    def machines(params={})
      get 'my/machines', params
    end

    def create_machine(body={})
      post 'my/machines', body
    end

    def machine(id)
      get 'my/machines/' + id.to_s
    end

    def destroy_machine(id)
      delete 'my/machines/' + id.to_s
    end

    def stop_machine(id)
      post 'my/machines/' + id.to_s, {action: :stop}
    end

    def start_machine(id)
      post 'my/machines/' + id.to_s, {action: :start}
    end

    def reboot_machine(id)
      post 'my/machines/' + id.to_s, {action: :reboot}
    end

    def resize_machine(id, params={})
      params[:action] = 'resize'
      post 'my/machines/' + id.to_s, params
    end
  end
end
