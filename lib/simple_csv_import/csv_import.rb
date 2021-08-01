class CSVImport
    attr_reader :configuration
    def initialize()
        @configuration = CSVConfig.new
    end

    def self.from_file(filepath)
        import = new
        yield import.configuration
        rows = CSV.read(filepath,col_sep: ",", headers: true)
        import.process(rows)
    end
    def process(rows)
        rows.map { |row| processed(row) }
    end

    private def processed(row)
        parsed_row = {}
        @configuration.columns.each do |col|
            parsed_row[col.name] = col.type.call(row[col.column_num - 1 ])
        end
        parsed_row
    end
end