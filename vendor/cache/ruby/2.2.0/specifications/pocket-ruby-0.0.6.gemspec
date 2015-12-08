# -*- encoding: utf-8 -*-
# stub: pocket-ruby 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "pocket-ruby"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Turadg Aleahmad", "Jason Ng PT"]
  s.date = "2015-02-18"
  s.description = "A Ruby wrapper for the Pocket API v3 (Add, Modify and Retrieve)"
  s.email = ["turadg@aleahmad.net", "me@jasonngpt.com"]
  s.homepage = "https://github.com/turadg/pocket-ruby"
  s.rubyforge_project = "pocket-ruby"
  s.rubygems_version = "2.4.5.1"
  s.summary = "Ruby wrapper for the Pocket API v3"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sinatra>, ["~> 1.3.3"])
      s.add_development_dependency(%q<multi_xml>, [">= 0"])
      s.add_runtime_dependency(%q<faraday>, [">= 0.7"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_runtime_dependency(%q<multi_json>, [">= 1.0.3", "~> 1.0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0.4.0"])
    else
      s.add_dependency(%q<sinatra>, ["~> 1.3.3"])
      s.add_dependency(%q<multi_xml>, [">= 0"])
      s.add_dependency(%q<faraday>, [">= 0.7"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_dependency(%q<multi_json>, [">= 1.0.3", "~> 1.0"])
      s.add_dependency(%q<hashie>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<sinatra>, ["~> 1.3.3"])
    s.add_dependency(%q<multi_xml>, [">= 0"])
    s.add_dependency(%q<faraday>, [">= 0.7"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
    s.add_dependency(%q<multi_json>, [">= 1.0.3", "~> 1.0"])
    s.add_dependency(%q<hashie>, [">= 0.4.0"])
  end
end
