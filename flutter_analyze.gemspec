lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flutter_analyze/version.rb"

Gem::Specification.new do |spec|
  spec.name          = "flutter_analyze"
  spec.version       = FlutterAnalyze::VERSION
  spec.authors       = ["Mateusz Szklarek"]
  spec.email         = ["mateusz.szklarek@gmail.com"]

  spec.summary       = "Parser for flutter analyze output"
  spec.homepage      = "https://github.com/mateuszszklarek/flutter-analyze-parser"
  spec.license       = "MIT"

  spec.files         = ["lib/flutter_analyze_parser.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", "~> 0.6"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rb-readline", "~> 0.5"
end
