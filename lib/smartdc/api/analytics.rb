module Smartdc::Api
  module Analytics
    def analytics(params={})
      get 'my/analytics/instrumentations', params
    end

    def create_analytic(body={})
      post 'my/analytics/instrumentations', body
    end

    def analytic(id)
      get 'my/analytics/instrumentations/' + id.to_s
    end

    def destroy_analytic(id)
      delete 'my/analytics/instrumentations/' + id.to_s
    end

    def value_analytic(id)
      get 'my/analytics/instrumentations/' + id.to_s + '/value/raw'
    end

    def describe_analytics(params={})
      get 'my/analytics', params
    end
  end
end
