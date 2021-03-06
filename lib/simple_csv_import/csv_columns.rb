# frozen_string_literal: true

# Put csv data into columns array in expected format
class CSVColumns
  attr_reader :columns

  Column = Struct.new(:name, :column_num, :type)

  def initialize
    @columns = []
  end

  def string(name, column:)
    @columns << Column.new(name, column, ->(x) { x.to_s })
  end

  def float(name, column:)
    @columns << Column.new(name, column, ->(x) { x.to_f })
  end

  def int(name, column:)
    @columns << Column.new(name, column, ->(x) { x.to_i })
  end
end
