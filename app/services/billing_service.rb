class BillingService
  def initialize(client)
    @client = client
  end

  def make_bill
    if @client.client_payment_method.present?
      payment_method = @client.client_payment_method.payment_method

      ActiveRecord::Base.transaction do
        billing = create_billing(payment_method)
        @client.update(last_billed_at: Date.today)

        return billing.payment_method.message
      end
    else
      return "Falha ao processar o pagamento. Não há métodos de pagamento selecionados para o cliente #{@client.name}"
    end
  end

  private

    def create_billing(payment_method)
      Billing.create(client: @client, payment_method: payment_method)
    end
end
