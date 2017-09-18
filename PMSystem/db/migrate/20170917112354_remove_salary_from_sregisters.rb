class RemoveSalaryFromSregisters < ActiveRecord::Migration[5.1]
  def change
    remove_column :sregisters, :salary, :string
  end
end
