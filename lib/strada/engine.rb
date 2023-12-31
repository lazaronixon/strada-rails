module Strada
  class Engine < ::Rails::Engine
    # If you don't want to precompile Strada's assets (e.g., you're using jsbundling),
    # you can do this in an initializer:
    #
    # config.after_initialize do
    #   config.assets.precompile -= Strada::Engine::PRECOMPILE_ASSETS
    # end
    PRECOMPILE_ASSETS = %w( strada.js ).freeze

    initializer "strada.assets" do
      if Rails.application.config.respond_to?(:assets)
        Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
      end
    end

    config.app_generators do |g|
      g.template_engine :strada
    end
  end
end
