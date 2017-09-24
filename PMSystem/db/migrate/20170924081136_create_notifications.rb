class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :title
      t.text :content
      t.text :cin
      t.text :date

      t.timestamps
    end
  end
end
