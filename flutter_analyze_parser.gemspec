Gem::Specification.new do |spec|
  spec.name          = "flutter_analyze_parser"
  spec.version       = "0.1.2"
  spec.authors       = ["Mateusz Szklarek"]
  spec.email         = ["mateusz.szklarek@gmail.com"]
  spec.summary       = "Parser for flutter analyze output"
  spec.homepage      = "https://github.com/mateuszszklarek/flutter-analyze-parser"
  spec.license       = "MIT"
  spec.files         = ["lib/flutter_analyze_parser.rb"]

  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rb-readline", "~> 0.5"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.6"
  spec.add_development_dependency "rubocop-performance", "~> 1.0"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "codecov", "~> 0.6"
end
