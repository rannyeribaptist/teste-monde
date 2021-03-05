# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##
# Admin user
p 'Creating Admin user so you can test the app...'
Admin.create(email: 'admin@demo.com', password: '123456', password_confirmation: '123456')

##
# Payment Methods
p 'Creating Payment Methods...'
PaymentMethod.create(name: 'Crédito', message: 'Pagamento autorizado!')
PaymentMethod.create(name: 'Débito', message: 'Pagamento autorizado!')
PaymentMethod.create(name: 'Boleto', message: 'Boleto gerado!')
PaymentMethod.create(name: 'TED', message: 'Transferência realizada!')
PaymentMethod.create(name: 'Pix', message: 'Transferência realizada!')

##
# Clients
p 'Creating a few clients...'
10.times do
  Client.create(name: Faker::Name.name, billing_day: rand(1..25))
end

p 'Done'

##
# ClientPaymentMethods
p 'Relationing some payment methods with some clients...'
5.times do
  ClientPaymentMethod.create(client_id: rand(1..10), payment_method_id: rand(1..5))
end

p 'Ok'

##
# Billings
p 'Now, let\'s try to charge a few clients...'
10.times do
  client = Client.find(Client.pluck(:id).sample)
  if client.ready_to_bill?
    Billing.create(client_id: client.id, payment_method_id: client.client_payment_method.payment_method.id)
  end
end

p 'You\'re all set :)'
p 'Your credentials are:'

p 'email: admin@demo.com'
p 'passowrd: 123456'
