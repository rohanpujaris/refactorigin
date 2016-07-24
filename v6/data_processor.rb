module Spreadsheet
  class Dataprocessor
    def initialize(mapping, reader)
      @mapping = mapping
      @reader = reader
    end

    def spreadsheet_rows
      reader.each_row(mapping.values) do |row|
        yield process(unprocessed_row(row))
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

class User < ActiveRecord::Base
  # create_table :user do |t|
  #   t.string :name
  #   t.admin :boolean, default: true
  # end
end

class UsersController < ApplicationController
  def index
    if current_user.admin?
    else
    end
  end
end


class User < ActiveRecord::Base
  # create_table :users do |t|
  #   t.string :name
  #   t.references :role
  # end
end

class Role < ActiveRecord::Base
  # create_table :roles do |t|
  #   t.string :role
  # end
end

# Somewhere in controller
current_user == 'admin' ? do_something : do_something2

class Role < ActiveRecord::Base
  # create_table :roles do |t|
  #   t.integer :role
  # end
end

# Somewhere in controller
current_user == 1 ? do_something : do_something2

