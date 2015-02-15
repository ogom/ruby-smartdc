module Smartdc::Cli
  class Image < Thor
    include Smartdc::CliHelper

    desc 'list', 'Provides a list of images available in this datacenter.'
    def list
      output Smartdc.images, options.merge(table: :horizontal, include: %i[
        id name version type os
      ])
    end

    desc 'show [ID]', 'Gets an individual image by id.'
    def show(id)
      output Smartdc.image(id), options.merge(table: :vertical, exclude: %i[
        description files
      ])
    end
  end
end
