require 'bundler/gem_tasks'
require 'rdoc/task'
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

RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
end

task default: [ :rubocop, :test ]
