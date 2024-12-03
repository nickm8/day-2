class ReactorAnalyzer
    def initialize
      @data = [
        [7, 6, 4, 2, 1],
        [1, 2, 7, 8, 9],
        [9, 7, 6, 2, 1],
        [1, 3, 2, 4, 5],
        [8, 6, 4, 4, 1],
        [1, 3, 6, 7, 9]
      ]
    end
  
    def safe_report?(levels)
      return false if levels.length < 2
      
      differences = levels.each_cons(2).map { |a, b| b - a }
      
      all_increasing = differences.all? { |d| d.between?(1, 3) }
      all_decreasing = differences.all? { |d| d.between?(-3, -1) }
      
      all_increasing || all_decreasing
    end
  
    def count_safe_reports
      @data.count { |report| safe_report?(report) }
    end
  end

# Run the analysis
analyzer = ReactorAnalyzer.new
result = analyzer.count_safe_reports
puts "Number of safe reports: #{result}"
