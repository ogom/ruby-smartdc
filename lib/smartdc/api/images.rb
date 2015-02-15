module Smartdc::Api
  module Images
    def images(params={})
      get 'my/images', params
    end

    def image(id)
      get 'my/images/' + id.to_s
    end
  end
end
