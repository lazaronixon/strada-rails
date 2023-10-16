APPLICATION_LAYOUT_PATH = Rails.root.join("app/views/layouts/application.html.erb")

HIDE_ON_MOBILE_STYLE = <<-HTML.chomp
    <% if turbo_native_app? %>
      <style>.hide-on-mobile { display: none; }</style>
    <% end %>
HTML

destination = Pathname(destination_root)

say "Copy bridge controllers"
directory "#{__dir__}/app/javascript/controllers/bridge", "app/javascript/controllers/bridge"

say "Update stimulus manifest"
rails_command "stimulus:manifest:update"

say "Copy strada stylesheet"
copy_file "#{__dir__}/app/assets/stylesheets/strada.css", "app/assets/stylesheets/strada.css"

unless destination.join("app/assets/application.css").exist?
  if (stylesheets = Dir.glob "#{destination_root}/app/assets/stylesheets/application.*.{scss,css}").length > 0
    insert_into_file stylesheets.first.to_s, %(@import 'strada.css';)
  end
end

say "Add hide-on-mobile style in application layout"
insert_into_file APPLICATION_LAYOUT_PATH.to_s, "\n\n#{HIDE_ON_MOBILE_STYLE}", before: /\s*<\/head>/

say "Install Strada"
run "bun add @hotwired/stimulus"
