APPLICATION_LAYOUT_PATH = Rails.root.join("app/views/layouts/application.html.erb")

destination = Pathname(destination_root)

say "Copy bridge controllers"
directory "#{__dir__}/app/javascript/controllers/bridge", "app/javascript/controllers/bridge"

say "Copy strada stylesheet"
copy_file "#{__dir__}/app/assets/stylesheets/strada.css", "app/assets/stylesheets/strada.css"

unless destination.join("app/assets/application.css").exist?
  if (stylesheets = Dir.glob "#{destination_root}/app/assets/stylesheets/application.*.{scss,css}").length > 0
    insert_into_file stylesheets.first.to_s, %(@import 'strada.css';)
  end
end

say "Add hide-on-native style in application layout"
insert_into_file APPLICATION_LAYOUT_PATH.to_s, <<~ERB.indent(4).prepend("\n"), before: /^\s*<\/head>/
  <% if turbo_native_app? %>
    <style>.hide-on-native { display: none; }</style>
  <% end %>
ERB

say "Pin Strada"
say %(Appending: pin "@hotwired/strada", to: "strada.js", preload: true")
append_to_file "config/importmap.rb", %(pin "@hotwired/strada", to: "strada.js", preload: true\n)
