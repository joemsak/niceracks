require 'refinery'

module Refinery
  module Performances
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "performances"
          plugin.activity = {
            :class => Performance,
            :title => 'venue_name'
          }
        end
      end
    end
  end
end
