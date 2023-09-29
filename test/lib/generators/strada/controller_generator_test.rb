require "test_helper"
require "generators/strada/controller/controller_generator"

class Strada::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
  tests Strada::Generators::ControllerGenerator
  destination Dir.mktmpdir

  arguments %w(Messages index show)

  test "generates correct view templates" do
    run_generator
    assert_file "app/views/messages/index.html.erb"
    assert_file "app/views/messages/show.html.erb"
  end
end
