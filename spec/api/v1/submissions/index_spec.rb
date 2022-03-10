require "rails_helper"

RSpec.describe "submissions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/submissions", params: params
  end

  describe "basic fetch" do
    let!(:submission1) { create(:submission) }
    let!(:submission2) { create(:submission) }

    it "works" do
      expect(SubmissionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["submissions"])
      expect(d.map(&:id)).to match_array([submission1.id, submission2.id])
    end
  end
end
