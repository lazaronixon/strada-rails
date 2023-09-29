require "test_helper"
require "generators/strada/strada_generator"

module Rails
  def self.root
    path = File.expand_path("../tmp", __dir__)

    Pathname.new path
  end
end

class Strada::GeneratorTest < Rails::Generators::TestCase
  tests StradaGenerator
  destination Rails.root
  setup :prepare_destination

  test "generating a simple controller" do
    run_generator ["hello"]

    assert_file "app/javascript/controllers/bridge/hello_controller.js", /data-controller="bridge--hello"/
  end

  test "generating with camelized name" do
    run_generator ["HelloWorld"]

    assert_file "app/javascript/controllers/bridge/hello_world_controller.js", /data-controller="bridge--hello-world"/
  end


  test "generating with camelized name and lower case first letter" do
    run_generator ["helloWorld"]

    assert_file "app/javascript/controllers/bridge/hello_world_controller.js", /data-controller="bridge--hello-world"/
  end

  test "generating with kebab-cased name" do
    run_generator ["hello-world"]

    assert_file "app/javascript/controllers/bridge/hello_world_controller.js", /data-controller="bridge--hello-world"/
  end

  test "generating with underscored name" do
    run_generator ["hello_world"]

    assert_file "app/javascript/controllers/bridge/hello_world_controller.js", /data-controller="bridge--hello-world"/
  end

  test "removes tailing 'controller'" do
    run_generator ["HelloController"]

    assert_file "app/javascript/controllers/bridge/hello_controller.js", /data-controller="bridge--hello"/
  end
end
