require 'rails_helper'

RSpec.describe "submissions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/submissions/#{submission.id}"
  end

  describe 'basic destroy' do
    let!(:submission) { create(:submission) }

    it 'updates the resource' do
      expect(SubmissionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Submission.count }.by(-1)
      expect { submission.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
