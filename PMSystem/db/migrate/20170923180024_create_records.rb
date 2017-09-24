class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :year
      t.string :company
      t.string :offers

      t.timestamps
    end
  end
end
