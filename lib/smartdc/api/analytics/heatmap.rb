module Smartdc::Api
  module Analytics::Heatmap
    def analytic_image(analytic_id, params={})
      get 'my/analytics/instrumentations/' + analytic_id.to_s + '/value/heatmap/image', params
    end

    def analytic_details(analytic_id, params={})
      get 'my/analytics/instrumentations/' + analytic_id.to_s + '/value/heatmap/details', params
    end
  end
end
