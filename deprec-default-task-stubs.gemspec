# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "deprec-default-task-stubs"
  s.version     = "0.9.9"
  s.authors     = ["Ewout Vonk"]
  s.email       = ["dev@ewout.to"]
  s.homepage    = "https://github.com/ewoutvonk/deprec-default-task-stubs"
  s.summary     = %q{empty stubs for tasks (when non-existing) which are common in deprec}
  s.description = %q{empty stubs for tasks (when non-existing) which are common in deprec}

  s.rubyforge_project = "deprec-default-task-stubs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "deprec"
  s.add_runtime_dependency "capistrano"
end
