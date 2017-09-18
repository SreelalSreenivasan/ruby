class RemoveSalaryFromRregisters < ActiveRecord::Migration[5.1]
  def change
    remove_column :rregisters, :salary, :string
  end
end
