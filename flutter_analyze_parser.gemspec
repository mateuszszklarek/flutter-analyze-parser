lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flutter_analyze_parser/version"

Gem::Specification.new do |spec|
  spec.name          = 'flutter_analyze_parser'
  spec.version       = FlutterAnalyzeParser::VERSION
  spec.authors       = ['Mateusz Szklarek']
  spec.email         = ['mateusz.szklarek@gmail.com']

  spec.summary       = 'Parser for flutter analyze output'
  spec.homepage      = 'https://github.com/mateuszszklarek/test'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
