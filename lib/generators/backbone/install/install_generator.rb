require 'generators/backbone/helpers'

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"

      class_option :skip_git, type: :boolean,
                              aliases: '-G',
                              default: false,
                              desc: 'Skip Git ignores and keeps'

      class_option :coffee,   type: :boolean,
                              default: false,
                              desc: 'Use CoffeeScript templates'

      def inject_backbone
        if options[:coffee]
          inject_into_file "app/assets/javascripts/application.js.coffee", before: '#= require_tree' do
            result =  "#= require underscore\n"
            result += "#= require backbone\n"
            result += "#= require railsy_backbone.sync\n"
            result += "#= require railsy_backbone.datalink\n"
            result += "#= require backbone/#{application_name.underscore}\n"
            result
          end
        else
          inject_into_file "app/assets/javascripts/application.js", before: "//= require_tree" do
            result =  "//= require underscore\n"
            result += "//= require backbone\n"
            result += "//= require railsy_backbone.sync\n"
            result += "//= require railsy_backbone.datalink\n"
            result += "//= require backbone/#{application_name.underscore}\n"
          end
        end
      end

      def create_dir_layout
        %W{routers models views templates}.each do |dir|
          empty_directory "app/assets/javascripts/backbone/#{dir}"
          create_file "app/assets/javascripts/backbone/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end

      def create_app_file
        if options[:coffee]
          template "app.coffee", "app/assets/javascripts/backbone/#{application_name.underscore}.js.coffee"
        else
          template "app.js", "app/assets/javascripts/backbone/#{application_name.underscore}.js"
        end
      end
    end
  end
end
