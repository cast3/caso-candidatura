class CreatePeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :periods do |t|
      t.string :start_year
      t.string :end_year

      t.timestamps
    end
  end
end
