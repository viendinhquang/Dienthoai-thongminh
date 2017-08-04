# -*- encoding: utf-8 -*-
# stub: dragonfly-s3_data_store 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dragonfly-s3_data_store"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mark Evans"]
  s.date = "2017-05-06"
  s.description = "S3 data store for Dragonfly"
  s.email = ["mark@new-bamboo.co.uk"]
  s.homepage = "https://github.com/markevans/dragonfly-s3_data_store"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Data store for storing Dragonfly content (e.g. images) on S3"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dragonfly>, ["~> 1.0"])
      s.add_runtime_dependency(%q<fog-aws>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<dragonfly>, ["~> 1.0"])
      s.add_dependency(%q<fog-aws>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<dragonfly>, ["~> 1.0"])
    s.add_dependency(%q<fog-aws>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
