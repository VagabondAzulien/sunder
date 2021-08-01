Gem::Specification.new do |spec|
  spec.name          = 'sunder'
  spec.version       = '0.1.0'

  spec.authors       = ['Bill Niblock']
  spec.email         = ['bill@theinternetvagabond.com']

  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.summary       = 'Sunder a single audio file into smaller tracks.'
  spec.homepage      = 'https://www.github.com/vagabondazulien/sunder'
  spec.license       = 'WTFPL'

  spec.executables   << 'sunder'
  spec.files         = Dir['lib/**/*.rb'] +
                       ['bin/sunder']

  spec.add_dependency "thor"
end
