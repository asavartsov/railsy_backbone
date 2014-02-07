require 'generators/backbone/helpers'

module Backbone
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::Helpers

      class_option :coffee, type: :boolean,
                            default: false,
                            desc: 'Use CoffeeScript templates'

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone model"

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_backbone_model
        if options[:coffee]
          template "model.coffee", "#{backbone_path}/models/#{file_name}.js.coffee"
        else
          template "model.js", "#{backbone_path}/models/#{file_name}.js"
        end
      end
    end
  end
end
