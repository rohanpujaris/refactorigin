module SpreadSheet
  class BaseReader
    attr_reader :file_url, :start_row, :end_row, :spreadsheet

    def initialize(file_url, options)
      @file_url = file_url
    end

    def each_row(_)
      raise 'each_row method must be implemented by SpreadsheetLoader::Reader subclass'
    end
  end
end
