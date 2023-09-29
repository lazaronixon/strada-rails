APPLICATION_LAYOUT_PATH = Rails.root.join("app/views/layouts/application.html.erb")

HIDE_ON_MOBILE_STYLE = <<-HTML.chomp
    <% if turbo_native_app? %>
      <style>.hide-on-mobile { display: none; }</style>
    <% end %>
HTML

say "Copy bridge controllers"
directory "#{__dir__}/app/javascript/controllers/bridge", "app/javascript/controllers/bridge"

say "Copy strada stylesheet"
copy_file "#{__dir__}/app/assets/stylesheets/strada.css", "app/assets/stylesheets/strada.css"

say "Add hide-on-mobile style in application layout"
insert_into_file APPLICATION_LAYOUT_PATH.to_s, "\n\n#{HIDE_ON_MOBILE_STYLE}", before: /\s*<\/head>/

say "Pin Strada"
say %(Appending: pin "@hotwired/strada", to: "strada.js", preload: true")
append_to_file "config/importmap.rb", %(pin "@hotwired/strada", to: "strada.js", preload: true\n)
