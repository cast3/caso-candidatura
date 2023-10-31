class Candidature < ApplicationRecord
  has_many :candidate, class_name: "candidate", foreign_key: "candidate_id"
  has_many :municipality , class_name: "municipality", foreign_key: "municipality_id"
  has_many :period, class_name: "period", foreign_key: "period_id"
  has_many :party, class_name: "party", foreign_key: "party_id"
end
