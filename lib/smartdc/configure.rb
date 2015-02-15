module Smartdc
  module Configure
    class << self
      def attributes
        @attributes ||= %i[
          url version ssl_verify middleware
          username use_key rsa_path
        ]
      end

      def setup
        attributes.each do |attribute|
          if Smartdc::Default.respond_to?(attribute)
            instance_variable_set(:"@#{attribute}", Smartdc::Default.send(attribute))
          end
        end
      end

      def options
        Hash[
          Smartdc::Configure.attributes.map do |attribute|
            [attribute, instance_variable_get(:"@#{attribute}")]
          end
        ]
      end

      attr_accessor *Smartdc::Configure.attributes
    end
  end
end
