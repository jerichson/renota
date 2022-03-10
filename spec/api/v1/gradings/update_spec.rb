require 'rails_helper'

RSpec.describe "gradings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/gradings/#{grading.id}", payload
  end

  describe 'basic update' do
    let!(:grading) { create(:grading) }

    let(:payload) do
      {
        data: {
          id: grading.id.to_s,
          type: 'gradings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GradingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { grading.reload.attributes }
    end
  end
end
