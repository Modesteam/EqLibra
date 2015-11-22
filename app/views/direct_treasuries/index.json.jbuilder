json.array!(@direct_treasuries) do |direct_treasury|
  json.extract! direct_treasury, :id, :title, :buyDate, :dueDate, :investment_value, :acquisitionsTax, :admTax, :wallet_id
  json.url direct_treasury_url(direct_treasury, format: :json)
end
