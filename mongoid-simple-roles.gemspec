# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "mongoid-simple-roles"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["drefined"]
  s.email       = ["d.refined@gmail.com"]
  s.homepage    = "https://github.com/drefined/mongoid-simple-roles"
  s.summary     = %q{mongoid simple roles for sinatra}
  s.description = %q{basic and simple roles system for mongoid v3}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "mongoid", "~> 3.0.3"
  s.add_dependency "bson_ext", "~> 1.6"

  s.add_development_dependency "rspec", "~> 2.10.0"
end
