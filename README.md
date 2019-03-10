# FlutterAnalyzeParser

[![Build Status](https://travis-ci.org/mateuszszklarek/flutter-analyze-parser.svg?branch=master)](https://travis-ci.org/mateuszszklarek/flutter-analyze-parser)
[![codecov](https://codecov.io/gh/mateuszszklarek/flutter-analyze-parser/branch/master/graph/badge.svg)](https://codecov.io/gh/mateuszszklarek/flutter-analyze-parser)

Parser for `flutter analyze` output.

## Installation

Add this line to your application's Gemfile:

	$ gem 'flutter_analyze_parser'

Or install it yourself as:

    $ gem install flutter_analyze_parser

## Usage

When **there are no violations** in flutter project and you run `flutter analyze` your output in console will looks like below:

	Analyzing my_flutter_project...
	No issues found! (ran in 1.8s)

When **there are some violations**:

	Analyzing my_flutter_project...
	
	   info • Name types using UpperCamelCase • lib/main.dart:5:7 • camel_case_types
	   info • Prefer const with constant constructors • lib/main.dart:13:13 • prefer_const_constructors
	   info • Name types using UpperCamelCase • lib/main.dart:19:7 • camel_case_types
	   info • Name types using UpperCamelCase • lib/main.dart:27:7 • camel_case_types
	   info • Prefer const with constant constructors • lib/pages/home_page.dart:49:10 • prefer_const_constructors
	   
Gem takes an output and return array with violations (when there are no violations array will be empty).

Example usage in script

```
require 'flutter_analyze_parser'

input = """
Analyzing my_flutter_project...

   info • Name types using UpperCamelCase • lib/main.dart:5:7 • camel_case_types
   info • Prefer const with constant constructors • lib/main.dart:13:13 • prefer_const_constructors
   info • Name types using UpperCamelCase • lib/main.dart:19:7 • camel_case_types
   info • Name types using UpperCamelCase • lib/main.dart:27:7 • camel_case_types
   info • Prefer const with constant constructors • lib/pages/home_page.dart:49:10 • prefer_const_constructors
"""
puts FlutterAnalyzeParser.violations(input)

#<struct FlutterViolation rule="camel_case_types", description="Name types using UpperCamelCase", file="lib/main.dart", line=5>
#<struct FlutterViolation rule="prefer_const_constructors", description="Prefer const with constant constructors", file="lib/main.dart", line=13>
#<struct FlutterViolation rule="camel_case_types", description="Name types using UpperCamelCase", file="lib/main.dart", line=19>
#<struct FlutterViolation rule="camel_case_types", description="Name types using UpperCamelCase", file="lib/main.dart", line=27>
#<struct FlutterViolation rule="prefer_const_constructors", description="Prefer const with constant constructors", file="lib/pages/home_page.dart", line=49>
```

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mateuszszklarek/flutter_analyze_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
