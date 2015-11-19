json.array!(@investment_funds) do |investment_fund|
  json.extract! investment_fund, :id, :name, :buyDate, :admTax, :nfo, :fundBegin, :manager, :managerContact, :shareValue, :capital, :closing_price, :closing_date, :wallet_id
  json.url investment_fund_url(investment_fund, format: :json)
end
