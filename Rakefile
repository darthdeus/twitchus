require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new

Cucumber::Rake::Task.new :features do |t|
  t.cucumber_opts = "features --format pretty"
end

task :test => :speed

task :default do
  Rake::Task["spec"].invoke
  Rake::Task["features"].invoke
end

