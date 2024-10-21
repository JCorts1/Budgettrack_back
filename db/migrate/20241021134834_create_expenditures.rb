class CreateExpenditures < ActiveRecord::Migration[7.1]
  def change
    create_table :expenditures do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :category
      t.integer :month

      t.timestamps
    end
  end
end
