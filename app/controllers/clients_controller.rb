class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy edit_payment_method update_payment_method ]
  before_action :set_payment_method, only: %i[ edit_payment_method update_payment_method ]
  before_action :authenticate_admin!

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit_payment_method
  end

  def update_payment_method
    @payment_method.payment_method_id = params[:client_payment_method][:payment_method_id]

    respond_to do |format|
      if @payment_method.save
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def set_payment_method
      @payment_method = @client.client_payment_method
      @payment_method ||= ClientPaymentMethod.new(client: @client)
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :last_billed_at, :billing_day, :client_payment_method)
    end
end
