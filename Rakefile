require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# Run `rake console` for test
task :console do
  exec "irb -r cymon -I ./lib"
end