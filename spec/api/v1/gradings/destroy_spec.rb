require 'rails_helper'

RSpec.describe "gradings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/gradings/#{grading.id}"
  end

  describe 'basic destroy' do
    let!(:grading) { create(:grading) }

    it 'updates the resource' do
      expect(GradingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Grading.count }.by(-1)
      expect { grading.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
