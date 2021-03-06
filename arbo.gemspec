# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','arbo','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'arbo'
  s.version = Arbo::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
# Add your other files here if you make them
  s.files = %w(
bin/arbo
lib/arbo/version.rb
lib/arbo/arbo_db.rb
lib/arbo/crypto.rb
lib/arbo/delete.rb
lib/arbo/generate.rb
lib/arbo/generator.rb
lib/arbo/get.rb
lib/arbo/help.rb
lib/arbo/init.rb
lib/arbo/list.rb
lib/arbo/set.rb
lib/arbo.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','arbo.rdoc']
  s.rdoc_options << '--title' << 'arbo' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'arbo'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('fakefs')
  s.add_development_dependency('mocha')
  s.add_runtime_dependency('gli','2.8.1')
  s.add_runtime_dependency('crypt')
  s.add_runtime_dependency('clipboard')
end
