require "rails_helper"

RSpec.describe "gradings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gradings", params: params
  end

  describe "basic fetch" do
    let!(:grading1) { create(:grading) }
    let!(:grading2) { create(:grading) }

    it "works" do
      expect(GradingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["gradings"])
      expect(d.map(&:id)).to match_array([grading1.id, grading2.id])
    end
  end
end
