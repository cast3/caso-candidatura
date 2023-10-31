class Period < ApplicationRecord
    def display_name
        "#{start_year} - #{end_year}"
      end
end
