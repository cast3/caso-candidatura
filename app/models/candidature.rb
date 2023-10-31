class Candidature < ApplicationRecord
  belongs_to :candidate
  belongs_to :municipality
  belongs_to :period
  has_many :candidature_parties
  has_many :parties, through: :candidature_parties
end
