json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :name, :initial_income, :current_income, :efficiency, :initial_dollar_quotation, :initial_euro_quotation, :discount, :buy_date, :exchange_type, :dollar_quotation, :euro_quotation, :variation_dollar, :variation_euro, :wallet_id
  json.url exchange_url(exchange, format: :json)
end
