module Refinery
  module Promotions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Promotions

      engine_name :refinery_promotions

      initializer "register refinerycms_promotions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "promotions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.promotions_admin_promotions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/promotions/promotion'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Promotions)
      end
    end
  end
end
