# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb-gust/version'

Gem::Specification.new do |gem|
  gem.name          = "rb-gust"
  gem.description   = 'A tool for loading spreadsheet data into ruby objects'
  gem.summary       = 'Load data from a spreadsheets directly into Ruby objects for further manipulation. Useful while bulk uploading data for applications, analytics, or scripting.'
  gem.homepage      = 'http://www.github.com/6kites/rb-gust/'

  gem.version       = Gust::VERSION
  gem.license       = 'MIT'

  gem.authors       = 'Nathan Feaver'
  gem.email         = 'nathan@nathanfeaver.com'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  ### DEPENDENCIES
  gem.add_dependency('spreadsheet')
  gem.add_dependency('active_support')

  # Development Dependencies
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('pry')
end
