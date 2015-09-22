Gem::Specification.new do |gem|
  gem.name    = 'baron-tiles'
  gem.version = '0.0.1'
  gem.date    = Date.today.to_s

  gem.summary = "18xx tiles generator"
  gem.description = "18xx tile generator"

  gem.authors  = ['Gregor MacDougall']
  gem.email    = 'gmacdougall@gmail.com'
  gem.homepage = 'http://github.com/18xx/baron-tiles'

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 3.3.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
