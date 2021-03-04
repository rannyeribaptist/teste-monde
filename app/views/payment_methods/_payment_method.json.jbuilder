json.extract! payment_method, :id, :name, :message, :created_at, :updated_at
json.url payment_method_url(payment_method, format: :json)
