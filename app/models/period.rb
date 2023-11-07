class Period < ApplicationRecord
    validates :start_year, presence: { message: "El año de inicio es obligatorio" }
    validates :end_year, presence: { message: "El año de fin es obligatorio" }

    def display_name
        "#{start_year} - #{end_year}"
    end
end
