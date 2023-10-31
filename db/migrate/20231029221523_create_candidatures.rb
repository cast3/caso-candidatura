class CreateCandidatures < ActiveRecord::Migration[7.1]
  def change
    create_table :candidatures do |t|
      t.string :codeInscription
      t.datetime :dateInscription
      t.references :candidate, null: false, foreign_key: true
      t.references :municipality, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
