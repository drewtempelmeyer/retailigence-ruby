require "bundler/gem_tasks"
require 'rake/testtask'
require 'rubocop/rake_task'

Rubocop::RakeTask.new(:rubocop)

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/test_*.rb'
  test.verbose = false
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'retailigence_ruby' # You know what to do.
  ARGV.clear
  IRB.start
end
