 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/billings", type: :request do
  # Billing. As you add validations to Billing, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Billing.create! valid_attributes
      get billings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      billing = Billing.create! valid_attributes
      get billing_url(billing)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_billing_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      billing = Billing.create! valid_attributes
      get edit_billing_url(billing)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Billing" do
        expect {
          post billings_url, params: { billing: valid_attributes }
        }.to change(Billing, :count).by(1)
      end

      it "redirects to the created billing" do
        post billings_url, params: { billing: valid_attributes }
        expect(response).to redirect_to(billing_url(Billing.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Billing" do
        expect {
          post billings_url, params: { billing: invalid_attributes }
        }.to change(Billing, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post billings_url, params: { billing: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested billing" do
        billing = Billing.create! valid_attributes
        patch billing_url(billing), params: { billing: new_attributes }
        billing.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the billing" do
        billing = Billing.create! valid_attributes
        patch billing_url(billing), params: { billing: new_attributes }
        billing.reload
        expect(response).to redirect_to(billing_url(billing))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        billing = Billing.create! valid_attributes
        patch billing_url(billing), params: { billing: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested billing" do
      billing = Billing.create! valid_attributes
      expect {
        delete billing_url(billing)
      }.to change(Billing, :count).by(-1)
    end

    it "redirects to the billings list" do
      billing = Billing.create! valid_attributes
      delete billing_url(billing)
      expect(response).to redirect_to(billings_url)
    end
  end
end
