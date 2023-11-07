class Party < ApplicationRecord
    validates :identification, presence: { message: "El campo de identificación es obligatorio" }
    validates :name, presence: { message: "El nombre es obligatorio" }

    has_many :candidature_parties
    has_many :candidatures, through: :candidature_parties
end
