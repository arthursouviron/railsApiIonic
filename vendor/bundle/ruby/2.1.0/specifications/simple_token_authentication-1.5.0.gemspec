# -*- encoding: utf-8 -*-
# stub: simple_token_authentication 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_token_authentication"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gonzalo Bulnes Guilpain"]
  s.date = "2014-05-31"
  s.email = ["gon.bulnes@gmail.com"]
  s.homepage = "https://github.com/gonzalo-bulnes/simple_token_authentication"
  s.licenses = ["GPLv3"]
  s.rubygems_version = "2.2.2"
  s.summary = "Simple (but safe) token authentication for Rails apps or API with Devise."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5", ">= 3.2.6"])
      s.add_runtime_dependency(%q<actionmailer>, ["< 5", ">= 3.2.6"])
      s.add_runtime_dependency(%q<devise>, ["~> 3.2.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<cucumber-rails>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5", ">= 3.2.6"])
      s.add_dependency(%q<actionmailer>, ["< 5", ">= 3.2.6"])
      s.add_dependency(%q<devise>, ["~> 3.2.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<cucumber-rails>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5", ">= 3.2.6"])
    s.add_dependency(%q<actionmailer>, ["< 5", ">= 3.2.6"])
    s.add_dependency(%q<devise>, ["~> 3.2.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<cucumber-rails>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
  end
end
