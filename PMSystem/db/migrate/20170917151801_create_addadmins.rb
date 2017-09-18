class CreateAddadmins < ActiveRecord::Migration[5.1]
  def change
    create_table :addadmins do |t|
      t.string :empid
      t.string :name
      t.string :contact

      t.timestamps
    end
  end
end
