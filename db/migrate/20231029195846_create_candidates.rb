class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates do |t|
      t.string :identification
      t.string :name

      t.timestamps
    end
  end
end
