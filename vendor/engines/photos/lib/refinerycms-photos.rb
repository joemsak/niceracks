require 'refinery'

module Refinery
  module Photos
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "photos"
          plugin.activity = {
            :class => Photo,
            :title => 'caption'
          }
        end
      end
    end
  end
end
