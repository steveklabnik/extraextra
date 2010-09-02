# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{extraextra}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Klabnik"]
  s.date = %q{2010-09-01}
  s.description = %q{Need to add a news feed to your application? EXTRA! EXTRA! is just the Gem for you! This is a common need for many social applications. EXTRA! EXTRA! uses MongoDB to give you super fast, super convenient feeds.}
  s.email = %q{steve@steveklabnik.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "extraextra.gemspec",
     "lib/extra/extra.rb",
     "lib/extraextra.rb",
     "spec/extraextra_spec.rb",
     "spec/factories/user.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "test.rb"
  ]
  s.homepage = %q{http://github.com/steveklabnik/extraextra}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Super simple news feeds powered by MongoDB.}
  s.test_files = [
    "spec/extraextra_spec.rb",
     "spec/factories/user.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 1.3.0"])
      s.add_runtime_dependency(%q<mongo>, ["= 1.0.8"])
    else
      s.add_dependency(%q<rspec>, ["= 1.3.0"])
      s.add_dependency(%q<mongo>, ["= 1.0.8"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 1.3.0"])
    s.add_dependency(%q<mongo>, ["= 1.0.8"])
  end
end

