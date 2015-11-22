class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.string :comments
      t.belongs_to :user, index: true, foreign_key: true
      t.references :investment_fund, :stocks, :exchanges, :direct_treasuries

      t.timestamps null: false
    end
  end
end
