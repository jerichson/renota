require 'rails_helper'

RSpec.describe "submissions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/submissions/#{submission.id}", payload
  end

  describe 'basic update' do
    let!(:submission) { create(:submission) }

    let(:payload) do
      {
        data: {
          id: submission.id.to_s,
          type: 'submissions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SubmissionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { submission.reload.attributes }
    end
  end
end
