require "flutter_analyze/version"

FlutterViolation = Struct.new(:rule, :description, :file, :line)

module FlutterAnalyze
  class Parser
    def self.violations(input)
      _, *rest = input.split("\n")

      if rest.first.include? "No issues found!"
        return []
      else
        violations = []

        rest.drop(1).each do |line|
          _, description, file_with_line_number, rule = line.split(" • ")
          file, line, = file_with_line_number.split(":")

          violations << FlutterViolation.new(rule, description, file, line.to_i)
        end

        return violations
      end
    end
  end
end
