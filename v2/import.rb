module Spreadsheet
  class Import
    attr_reader :file_url, :mapping, :start_row, :end_row, :spreadsheet

    def initialize(file_url, mapping, options)
      @file_url = file_url
      # format {column_name1: column_number, column_name2: column_number}
      # eg) {city: 0, tax_rate: 1}
      @mapping = mapping
      @start_row = options.fetch(:start_row, 0)
      @end_row = options.fetch(:end_row, 100)
      @spreadsheet = SimpleSpreadsheet::Workbook.read(file_url)
    end

    def import(model)
      (start_row..end_row).each do |row|
        row = mapping.values.each_with_object([]) do |col, acc|
          acc << spreadsheet.cell(row, col)
        end
        attributes = process(unprocessed_row(row))
        model.create(attributes)
      end
    end

    def process_row(unprocessed_row)
      # Do some processing on row
    end

    # will return data in format {column_name1: 'column_value', column_name2: value}
    def unprocessed_row(row)
      {}.tap do |attributes|
        mapping.keys.each_with_index do |column_name, index|
          attributes[column_name] = row[index]
        end
      end
    end
  end
end

Spreadsheet::Import('tax.csv', {city: 0, tax_rate: 1}, start_row: 1, end_row: 120).import(Tax)