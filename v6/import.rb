module Spreadsheet
  class Import
    attr_reader :data_processor

    def initialize(data_processor)
      @data_processor = data_processor
    end

    def import(model)
      data_processor.spreadsheet_rows { |row| model.create(attributes) }
    end
  end
end

reader = Spreadsheet::SimpleReader.new('tax.csv', start_row: 1, end_row: 120)
data_processor = Spreadsheet::Dataprocessor.new({city: 0, tax_rate: 1}, reader)
Spreadsheet::Import(data_processor).import(Tax)