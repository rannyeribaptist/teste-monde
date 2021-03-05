class BillingsController < ApplicationController
  before_action :set_billing, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  # GET /billings or /billings.json
  def index
    @billings = Billing.all
  end

  # GET /billings/1 or /billings/1.json
  def show
  end

  # GET /billings/new
  def new
    @billing = Billing.new
  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings or /billings.json
  def create
    client = Client.find_by_id(billing_params[:client_id].to_i)
    if !client.billed? && client.ready_to_bill?
      @billing = BillingService.new(client).make_bill
    else
      @billing = "Falha ao processar o pagamento. O cliente #{client.name} já foi cobrado ou não está dentro da data prevista para pagamento este mês"
    end

    respond_to do |format|
      format.html { redirect_to billings_path, notice: @billing }
    end
  end

  # PATCH/PUT /billings/1 or /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, notice: "Billing was successfully updated." }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1 or /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to billings_url, notice: "Billing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_params
      params.require(:billing).permit(:accounted_at, :client_id, :payment_method_id)
    end
end
