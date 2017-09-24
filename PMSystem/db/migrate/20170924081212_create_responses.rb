class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :sid
      t.text :sname
      t.text :cno
      t.text :cname

      t.timestamps
    end
  end
end
