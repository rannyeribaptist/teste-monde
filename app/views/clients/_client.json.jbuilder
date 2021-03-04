json.extract! client, :id, :name, :last_billed_at, :billing_date, :created_at, :updated_at
json.url client_url(client, format: :json)
