require "test_helper"
require "generators/strada/scaffold/scaffold_generator"

class Strada::Generators::ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Strada::Generators::ScaffoldGenerator
  destination Dir.mktmpdir

  arguments %w(message title:string content:text)

  test "generates correct view templates" do
    run_generator

    %w(index edit new show _form _message).each { |view| assert_file "app/views/messages/#{view}.html.erb" }
  end

  test "with namespace invoked" do
    run_generator [ "admin/role", "name:string", "description:string" ]

    %w(index edit new show _form _role).each { |view| assert_file "app/views/admin/roles/#{view}.html.erb" }
  end
end
