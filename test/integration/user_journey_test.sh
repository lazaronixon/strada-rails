#! /usr/bin/env bash
# reproduce the documented user journey for installing and running strada-rails
# this is run in the CI pipeline, non-zero exit code indicates a failure

set -o pipefail
set -eux

# create a rails app in a directory with spaces in the name (#176, #184)
rm -rf "Has A Space"
mkdir "Has A Space"
pushd "Has A Space"

gem install rails
rails new test-app --skip-bundle
pushd test-app

# install strada-rails
bundle add strada-rails --path="../.."
bundle install

bin/rails strada:install
