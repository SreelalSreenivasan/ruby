class CreateInboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :inboxes do |t|
      t.text :CIN
      t.text :title
      t.text :content
      t.string :tofrom

      t.timestamps
    end
  end
end
