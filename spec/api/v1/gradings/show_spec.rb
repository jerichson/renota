require "rails_helper"

RSpec.describe "gradings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gradings/#{grading.id}", params: params
  end

  describe "basic fetch" do
    let!(:grading) { create(:grading) }

    it "works" do
      expect(GradingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("gradings")
      expect(d.id).to eq(grading.id)
    end
  end
end
