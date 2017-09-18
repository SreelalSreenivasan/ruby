class AddSalaryToRregisters < ActiveRecord::Migration[5.1]
  def change
    add_column :rregisters, :salary, :string
  end
end
