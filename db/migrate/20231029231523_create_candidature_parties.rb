class CreateCandidatureParties < ActiveRecord::Migration[7.1]
  def change
    create_table :candidature_parties do |t|
      t.references :candidature, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
