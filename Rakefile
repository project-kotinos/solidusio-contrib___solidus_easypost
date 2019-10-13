# frozen_string_literal: true

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default do
  Rake::Task[:test_app].invoke
  Dir.chdir("../../")
  Rake::Task[:spec].invoke
end

task :test_app do
  ENV['LIB_NAME'] = 'solidus_easypost'
  Rake::Task['extension:test_app'].invoke
end
