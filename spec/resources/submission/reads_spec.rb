require 'rails_helper'

RSpec.describe SubmissionResource, type: :resource do
  describe 'serialization' do
    let!(:submission) { create(:submission) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(submission.id)
      expect(data.jsonapi_type).to eq('submissions')
    end
  end

  describe 'filtering' do
    let!(:submission1) { create(:submission) }
    let!(:submission2) { create(:submission) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: submission2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([submission2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:submission1) { create(:submission) }
      let!(:submission2) { create(:submission) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            submission1.id,
            submission2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            submission2.id,
            submission1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
