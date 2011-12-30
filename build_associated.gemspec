# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "build_associated/version"

Gem::Specification.new do |s|
  s.name        = "build_associated"
  s.version     = BuildAssociated::VERSION
  s.authors     = ["Adam Kerr"]
  s.email       = ["ajrkerr@gmail.com"]
  s.homepage    = "http://github.com/ajrkerr/build_associated"
  s.summary     = %q{Have ActiveRecord automagically build an association when accessed. Useful for belongs_to associations which should never be nil.}
  s.description = %q{Have ActiveRecord automagically build an association when accessed. Useful for belongs_to associations which should never be nil.}

  s.rubyforge_project = "build_associated"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "activerecord"
end
