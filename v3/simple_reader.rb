module Spreadsheet
  class SimpleReader
    attr_reader :file_url, :start_row, :end_row

    def initilize(file_url, options = {})
      @file_url = file_url
      @start_row = options.fetch(:start_row, 0)
      @end_row = options.fetch(:end_row, 100)
    end

    def each_row(required_columns = default_required_columns)
      row_range.each do |row|
        entire_row = required_columns.each_with_object([]) do |col, acc|
          acc << spreadsheet.cell(row, col)
        end
        yield entire_row
      end
    end

    private

    def default_required_columns
      spreadsheet.first_column.upto(spreadsheet.last_column)
    end

    def row_range
      (start_row..end_row)
    end
  end
end
