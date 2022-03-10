require "rails_helper"

RSpec.describe "submissions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/submissions/#{submission.id}", params: params
  end

  describe "basic fetch" do
    let!(:submission) { create(:submission) }

    it "works" do
      expect(SubmissionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("submissions")
      expect(d.id).to eq(submission.id)
    end
  end
end
