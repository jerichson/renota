require 'rails_helper'

RSpec.describe SubmissionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'submissions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SubmissionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Submission.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:submission) { create(:submission) }

    let(:payload) do
      {
        data: {
          id: submission.id.to_s,
          type: 'submissions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SubmissionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { submission.reload.updated_at }
      # .and change { submission.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:submission) { create(:submission) }

    let(:instance) do
      SubmissionResource.find(id: submission.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Submission.count }.by(-1)
    end
  end
end
