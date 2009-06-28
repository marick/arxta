# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{polyglot}
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Clifford Heath"]
  s.date = %q{2009-06-20}
  s.description = %q{Allows custom language loaders for specified file extensions to be hooked into require}
  s.email = %q{cjheath@rubyforge.org}
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/polyglot.rb", "lib/polyglot/version.rb", "test/test_helper.rb", "test/test_polyglot.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://polyglot.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{polyglot}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Allows custom language loaders for specified file extensions to be hooked into require}
  s.test_files = ["test/test_helper.rb", "test/test_polyglot.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
