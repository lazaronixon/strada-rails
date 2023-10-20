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

say "Pin Strada"
say %(Appending: pin "@hotwired/strada", to: "strada.js", preload: true")
append_to_file "config/importmap.rb", %(pin "@hotwired/strada", to: "strada.js", preload: true\n)
