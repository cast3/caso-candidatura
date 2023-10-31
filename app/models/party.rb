class Party < ApplicationRecord
    has_many :candidature_parties
    has_many :candidatures, through: :candidature_parties
end
