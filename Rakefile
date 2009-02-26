require 'rubygems'
require 'rake'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'threadsafe-attr-accessor'
    s.summary = 'Think attr_accessor, only thread-safe. Figures, huh?'
    s.email = 'meyer@paperplanes.de'
    s.homepage = 'http://github.com/mattmatt/threadsafe-attr-accessor'
    s.authors = ["Mathias Meyer"]
    s.files = FileList["[A-Z]*", "{lib,test}/**/*"]
  end
rescue LoadError 
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com" 
end

desc "Default Task"
task :default => ["test"]

desc "Runs the unit tests"
task :test => "test:unit"

namespace :test do
  desc "Unit tests"
  Rake::TestTask.new(:unit) do |t|
    t.libs << 'test/unit'
    t.pattern = "test/*_shoulda.rb"
    t.verbose = true
  end
end