require 'rails_helper'

describe TargetParamsValidator do
  subject { described_class.new(params) }

  describe '#valid?' do
    context 'when there is full valid params' do
      let(:params) do
        {
          country_code: 'UK',
          target_group_id: 1,
          locations: [
            {
              id: 1,
              panel_size: 1
            }
          ]
        }
      end

      it 'returns true' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'when contry_code is missed' do
      let(:params) do
        {
          target_group_id: 1,
          locations: [
            {
              id: 1,
              panel_size: 1
            }
          ]
        }
      end

      it 'returns false' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'when target_group_id is missed' do
      let(:params) do
        {
          country_code: 'UK',
          locations: [
            {
              id: 1,
              panel_size: 1
            }
          ]
        }
      end

      it 'returns false' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'when locations are missed' do
      let(:params) do
        {
          country_code: 'UK',
          target_group_id: 1
        }
      end

      it 'returns false' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'when country_code has incorrect value' do
      let(:params) do
        {
          country_code: 'BY',
          target_group_id: 1,
          locations: [
            {
              id: 1,
              panel_size: 1
            }
          ]
        }
      end

      it 'returns false' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'when locations params has incorrect structure' do
      let(:params) do
        {
          country_code: 'BY',
          target_group_id: 1,
          locations: [
            { id: 1 }
          ]
        }
      end

      it 'returns false' do
        expect(subject.valid?).to eq(false)
      end
    end
  end
end
