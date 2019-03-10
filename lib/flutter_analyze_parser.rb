FlutterViolation = Struct.new(:rule, :description, :file, :line)

class FlutterAnalyzeParser
  def self.violations(input)
    filtered_input = filtered_input(input)

    if filtered_input.first.include? "No issues found!"
      return []
    else
      violations = []

      filtered_input.each do |line|
        _, description, file_with_line_number, rule = line.split(" • ")
        file, line, = file_with_line_number.split(":")

        violations << FlutterViolation.new(rule, description, file, line.to_i)
      end

      return violations
    end
  end

  def self.filtered_input(input)
    input.each_line
      .reject { |line| line.strip.empty? }
      .map(&:strip)
      .drop(1)
  end
end
