Gem::Specification.new do |s|
  s.name          = "AmandaSQL"
  s.version       =  "0.0.1"
  s.license       = "MIT"
  s.authors       = ["Marcus Pereira"]
  s.email         = ["ola@marcuspereira.xyz"]
  s.homepage      = "https://github.com/marcuxyz/amandaSQL"
  s.summary       = "A simple script to migrate table in yaml file to database"
  s.description   = "A simple script to migrate table in yaml file to database"

  s.metadata      = {
    "source_code_uri" => "https://github.com/marcuxyz/amandaSQL",
    "bug_tracker_uri" => "https://github.com/marcuxyz/amandaSQL/issues",
    "changelog_uri"   => "https://github.com/marcuxyz/amandaSQL/releases",
    "homepage_uri"    => s.homepage,
  }

  s.required_ruby_version     = ">= 2.4.0"
  s.required_rubygems_version = ">= 2.7.0"

  s.add_runtime_dependency("thor",           "~> 1.0")
  s.add_runtime_dependency("pg",             "~> 1.2")
  s.add_runtime_dependency("mysql2",          "~> 0.4.10")
end