# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "friendlyrange"
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tim Cheadle"]
  s.email       = ["tim@rationalmeans.com"]
  s.homepage    = "http://github.com/timcheadle/friendlyrange"
  s.summary     = "An easy way to parse and compose human friendly number ranges"
  s.description = "FriendlyRange makes it easy to parse and compose ranges of numbers in a human friendly way."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "friendlyrange"

  s.add_development_dependency "rspec", "~> 2.13.0"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.require_path = 'lib'
end
