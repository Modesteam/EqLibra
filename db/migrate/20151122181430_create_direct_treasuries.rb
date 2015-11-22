class CreateDirectTreasuries < ActiveRecord::Migration
  def change
    create_table :direct_treasuries do |t|
      t.string :title
      t.date :buyDate
      t.date :dueDate
      t.float :investment_value
      t.float :acquisitionsTax
      t.float :admTax
      t.references :wallet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
