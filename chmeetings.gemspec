require 'English'
$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'chmeetings/version'

Gem::Specification.new do |s|
  s.name          = 'chmeetings'
  s.version       = Chmeetings::VERSION
  s.authors       = ['Taylor Brooks']
  s.homepage      = 'https://github.com/taylorbrooks/chmeetings'
  s.summary       = 'A Ruby wrapper for the ChMeetings API'
  s.description   = 'A Ruby wrapper for the ChMeetings API'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }

  s.required_ruby_version = '>= 2.7'

  s.require_paths = ['lib']

  s.add_runtime_dependency 'faraday', '> 2.0'
  s.add_runtime_dependency 'oj'

  s.metadata['rubygems_mfa_required'] = 'true'
end
