json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :initial_income, :current_income, :buy_date, :buy_tax, :amount, :wallet_id
  json.url stock_url(stock, format: :json)
end
