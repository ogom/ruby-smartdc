module Smartdc::Api
  module Keys
    def keys(params={})
      get 'my/keys', params
    end

    def create_key(body={})
      post 'my/keys', body
    end

    def key(id)
      get 'my/keys/' + id.to_s
    end

    def destroy_key(id)
      delete 'my/keys/' + id.to_s
    end
  end
end
