require "rails/generators/named_base"

class StradaGenerator < Rails::Generators::NamedBase # :nodoc:
  source_root File.expand_path("templates", __dir__)

  class_option :skip_manifest, type: :boolean, default: false, desc: "Don't update the stimulus manifest"

  def copy_view_files
    @attribute = strada_attribute_value(controller_name)
    template "controller.js", "app/javascript/controllers/bridge/#{controller_name}_controller.js"
    rails_command "stimulus:manifest:update" unless Rails.root.join("config/importmap.rb").exist? || options[:skip_manifest]
  end

  private
    def controller_name
      name.underscore.gsub(/_controller$/, "")
    end

    def strada_attribute_value(controller_name)
      controller_name.gsub(/\//, "--").gsub("_", "-")
    end
end
