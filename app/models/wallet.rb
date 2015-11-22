class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :investment_fund
  has_many :stock
  has_many :exchange
  has_many :direct_treasury
end