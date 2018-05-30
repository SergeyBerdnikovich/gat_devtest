require 'rails_helper'

describe Evaluators::TargetEvaluator do
  subject { described_class.new(params) }

  describe '#evaluate' do
    let(:params)           { { country_code: 'UK' } }
    let(:price)            { 12.12 }
    let(:price_calculator) { double(:price_calculator, calculate: price) }
    let!(:country)         { FactoryBot.create(:country, code: 'UK') }

    before { allow(subject).to receive(:price_calculator).and_return(price_calculator) }

    it 'calculates price' do
      subject.evaluate

      expect(subject.price).to eq(price)
    end

    it 'calls fetch_country->fetch_panel_provider_code->calculate_price' do
      expect(subject).to receive(:fetch_country).and_return(country)
      expect(subject).to receive(:fetch_panel_provider_code).and_return(country.panel_provider.code)
      expect(subject).to receive(:calculate_price).and_return(price)

      subject.evaluate
    end
  end
end
