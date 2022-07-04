RSpec.describe FlutterAnalyzeParser do
  let(:content) { File.readlines(filename).reduce(:+) }

  describe "when read input file without violations" do
    let(:filename) { File.dirname(__FILE__) + "/fixtures/test_input_without_violations.txt" }

    it "should reads a content" do
      expect(content).not_to be nil
    end

    describe "violations" do
      it "should be empty" do
        expect(FlutterAnalyzeParser.violations(content)).to be_empty
      end
    end
  end

  describe "when read input file with violations" do
    let(:filename) { File.dirname(__FILE__) + "/fixtures/test_input_with_violations.txt" }

    it "should reads a content" do
      expect(content).not_to be nil
    end

    describe "violations" do
      let(:violations) { FlutterAnalyzeParser.violations(content) }

      it "should not be empty" do
        expect(violations).not_to be_empty
      end

      it "should have 7 items" do
        expect(violations.length).to eq(7)
      end

      describe "1st item" do
        it "should have correct fields" do
          expected = FlutterViolation.new(
            "info",
            "camel_case_types",
            "Name types using UpperCamelCase",
            "lib/main.dart",
            5
          )

          expect(violations.first).to eq(expected)
        end
      end

      describe "4st item" do
        it "should have correct fields" do
          expected = FlutterViolation.new(
            "warning",
            "unrecognized_error_code",
            "'demo' isn't a recognized error code",
            "analysis_options.yaml",
            5
          )

          expect(violations.fetch(3)).to eq(expected)
        end
      end

      describe "5st item" do
        it "should have correct fields" do
          expected = FlutterViolation.new(
            "error",
            "argument_type_not_assignable",
            "The argument type 'Null' can't be assigned to the parameter type 'String'",
            "lib/main.dart",
            14
          )

          expect(violations.fetch(4)).to eq(expected)
        end
      end

      describe "last item" do
        it "should have correct fields" do
          expected = FlutterViolation.new(
            "info",
            "prefer_const_constructors",
            "Prefer const with constant constructors",
            "lib/pages/home_page.dart",
            49
          )

          expect(violations.last).to eq(expected)
        end
      end
    end
  end
end
