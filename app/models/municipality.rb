class Municipality < ApplicationRecord
    validates :daneCode, presence: { message: "El campo de código es obligatorio" }
    validates :name, presence: { message: "El nombre es obligatorio" }
end
