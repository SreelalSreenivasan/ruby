class CreateRregisters < ActiveRecord::Migration[5.1]
  def change
    create_table :rregisters do |t|
      t.string :cinno
      t.string :company
      t.string :name
      t.string :link
      t.string :cno
      t.string :mail
      t.string :salary

      t.timestamps
    end
  end
end
