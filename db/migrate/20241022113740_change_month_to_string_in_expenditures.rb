class ChangeMonthToStringInExpenditures < ActiveRecord::Migration[7.1]
  def change
    change_column :expenditures, :month, :string
  end
end
