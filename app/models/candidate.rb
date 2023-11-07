class Candidate < ApplicationRecord
    validates :identification, presence: { message: "El campo de identificación es obligatorio" }
    validates :name, presence: { message: "El nombre es obligatorio" }
end
