class CandidatureParty < ApplicationRecord
    belongs_to :candidature
    belongs_to :party
end
