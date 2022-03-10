require 'rails_helper'

RSpec.describe GradingResource, type: :resource do
  describe 'serialization' do
    let!(:grading) { create(:grading) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(grading.id)
      expect(data.jsonapi_type).to eq('gradings')
    end
  end

  describe 'filtering' do
    let!(:grading1) { create(:grading) }
    let!(:grading2) { create(:grading) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: grading2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([grading2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:grading1) { create(:grading) }
      let!(:grading2) { create(:grading) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            grading1.id,
            grading2.id
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
            grading2.id,
            grading1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
