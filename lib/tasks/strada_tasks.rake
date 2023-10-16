def run_strada_install_template(path)
  system "#{RbConfig.ruby} ./bin/rails app:template LOCATION=#{File.expand_path("../install/#{path}.rb",  __dir__)}"
end

def install_strada_with_importmap?
  Rails.root.join("config/importmap.rb").exist?
end

def install_strada_with_bun?
  Rails.root.join("package.json").exist? && Rails.root.join("bun.config.js").exist?
end

def install_strada_with_node?
  Rails.root.join("package.json").exist? && !Rails.root.join("bun.config.js").exist?
end

namespace :strada do
  desc "Install Strada into the app"
  task :install do
    if install_strada_with_importmap?
      Rake::Task["strada:install:importmap"].invoke
    elsif install_strada_with_bun?
      Rake::Task["strada:install:bun"].invoke
    elsif install_strada_with_node?
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

    desc "Install Stimulus on an app running bun"
    task :bun do
      run_strada_install_template "strada_with_bun"
    end
  end
end
