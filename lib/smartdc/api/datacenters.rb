module Smartdc::Api
  module Datacenters
    def datacenters(params={})
      get 'my/datacenters', params
    end

    def datacenter(id)
      get 'my/datacenters/' + id.to_s
    end
  end
end
