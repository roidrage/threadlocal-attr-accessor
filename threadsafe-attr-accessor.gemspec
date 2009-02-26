# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{threadsafe-attr-accessor}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mathias Meyer"]
  s.date = %q{2009-02-26}
  s.email = %q{meyer@paperplanes.de}
  s.files = ["Rakefile", "README.md", "VERSION.yml", "lib/core_ext", "lib/core_ext/module.rb", "test/attr_accessor_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mattmatt/threadsafe-attr-accessor}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Think attr_accessor, only thread-safe. Figures, huh?}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
