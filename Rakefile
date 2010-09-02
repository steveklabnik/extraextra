require "rubygems"
require "bundler/setup"

#require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "extraextra"
    gem.summary = %Q{Super simple news feeds powered by MongoDB.}
    gem.description = %Q{Need to add a news feed to your application? EXTRA! EXTRA! is just the Gem for you! This is a common need for many social applications. EXTRA! EXTRA! uses MongoDB to give you super fast, super convenient feeds.}
    gem.email = "steve@steveklabnik.com"
    gem.homepage = "http://github.com/steveklabnik/extraextra"
    gem.authors = ["Steve Klabnik"]
    gem.add_development_dependency "rspec", "=1.3.0"
    gem.add_dependency "mongo", "=1.0.8"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "extraextra #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
