namespace :routines do
  # everyday
  desc 'Runs daily billing clients with billing date for today'
  task bill_clients: :environment do
    Client.ready_to_bill.each do |client|
      client.bill! unless client.billed?
    end
  end
end
