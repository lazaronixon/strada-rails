say "Copy bridge controllers"
directory "#{__dir__}/app/javascript/controllers/bridge", "app/javascript/controllers/bridge"

say "Copy strada stylesheet"
copy_file "#{__dir__}/app/assets/stylesheets/strada.css", "app/assets/stylesheets/strada.css"

say "Copy application layout"
template "#{__dir__}/app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb", force: true

say "Install Strada"
run "yarn add @hotwired/strada"
