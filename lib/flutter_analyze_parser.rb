FlutterViolation = Struct.new(:severity, :rule, :description, :file, :line)

class FlutterAnalyzeParser
  class << self
    def violations(input)
      filtered_input = filter_input(input)

      return [] if filtered_input.detect { |element| element.include? "No issues found!" }

      filtered_input
        .select { |line| line.start_with? "info", "warning", "error" }
        .map(&method(:parse_line))
    end

    private

    def filter_input(input)
      input.each_line
        .map(&:strip)
        .reject(&:empty?)
    end

    def parse_line(line)
      severity, description, file_with_line_number, rule = line.split(" • ")
      file, line = file_with_line_number.split(":")

      FlutterViolation.new(severity, rule, description, file, line.to_i)
    end
  end
end
