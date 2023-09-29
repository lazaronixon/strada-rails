def run_strada_install_template(path)
  system "#{RbConfig.ruby} ./bin/rails app:template LOCATION=#{File.expand_path("../install/#{path}.rb",  __dir__)}"
end

namespace :strada do
  desc "Install Strada into the app"
  task :install do
    if Rails.root.join("config/importmap.rb").exist?
      Rake::Task["strada:install:importmap"].invoke
    elsif Rails.root.join("package.json").exist?
      Rake::Task["strada:install:node"].invoke
    else
      puts "You must either be running with node (package.json) or importmap-rails (config/importmap.rb) to use this gem."
    end
  end

  namespace :install do
    desc "Install Strada on an app running importmap-rails"
    task :importmap do
      run_strada_install_template "strada_with_importmap"
    end

    desc "Install Strada on an app running node"
    task :node do
      run_strada_install_template "strada_with_node"
    end
  end
end
