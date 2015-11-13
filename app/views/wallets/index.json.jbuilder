json.array!(@wallets) do |wallet|
  json.extract! wallet, :id, :name, :comments, :user_id
  json.url wallet_url(wallet, format: :json)
end
