class Candidature < ApplicationRecord
  validates :codeInscription, presence: { message: "El campo de código es obligatorio" }
  validates :dateInscription, presence: { message: "El campo de fecha es obligatorio" }
  validates :candidate_id, presence: { message: "El campo de candidato es obligatorio" }
  validates :municipality_id, presence: { message: "El campo de municipio es obligatorio" }
  validates :period_id, presence: { message: "El campo de periodo es obligatorio" }

  belongs_to :candidate
  belongs_to :municipality
  belongs_to :period
  has_many :candidature_parties
  has_many :parties, through: :candidature_parties
end
