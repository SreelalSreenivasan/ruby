class CreateMrecruiters < ActiveRecord::Migration[5.1]
  def change
    create_table :mrecruiters do |t|
      t.string :name
      t.string :logopath

      t.timestamps
    end
  end
end
