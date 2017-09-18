class CreateSregisters < ActiveRecord::Migration[5.1]
  def change
    create_table :sregisters do |t|
      t.string :rno
      t.string :name
      t.string :cgpa
      t.string :branch
      t.string :cno
      t.string :mail
      t.string :salary

      t.timestamps
    end

  end
end
