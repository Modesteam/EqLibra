class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.float :initial_income
      t.float :current_income
      t.datetime :buy_date
      t.float :buy_tax
      t.float :amount
      t.references :wallet, index: true, foreign_key: true
      t.decimal :closing_price
      t.date :closing_date

      t.timestamps null: false
    end
  end
end
