require 'refinery'

module Refinery
  module Ladies
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ladies"
          plugin.activity = {
            :class => Lady,
            :title => 'name'
          }
        end
      end
    end
  end
end
