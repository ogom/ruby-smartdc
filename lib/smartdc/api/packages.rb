module Smartdc::Api
  module Packages
    def packages(params={})
      get 'my/packages', params
    end

    def package(id)
      get 'my/packages/' + id.to_s
    end
  end
end
