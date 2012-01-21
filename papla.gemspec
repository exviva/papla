# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "papla/version"

Gem::Specification.new do |s|
  s.name        = "papla"
  s.version     = Papla::VERSION
  s.authors     = ["Olek Janiszewski"]
  s.email       = ["olek.janiszewski@gmail.com"]
  s.homepage    = "https://github.com/exviva/papla"
  s.summary     = %q{Use Ruby to convert numbers into Polish and English words}
  s.description = %q{Papla is a Ruby gem that allows you to convert numbers into Polish and English words.}

  s.rubyforge_project = "papla"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'i18n'

  s.add_development_dependency 'rspec', '>= 2.8.0'
  s.add_development_dependency 'rake'
end
