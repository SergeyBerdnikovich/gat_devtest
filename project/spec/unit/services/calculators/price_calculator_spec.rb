require 'rails_helper'

describe Calculators::PriceCalculator do
  subject { described_class.new(panel_provider_code) }

  describe '#calculate' do
    let(:panel_provider_code) { 'times_a' }
    let(:data_fetcher)        { double(:data_fetcher, fetch_data: data) }
    let(:data)                { 'asdasdas123123gsg' }
    let(:data_parser)         { double(:data_parser, parse: parsed_data) }
    let(:parsed_data)         { data }
    let(:counter)             { double(:counter, count: number_of_elements) }
    let(:number_of_elements)  { 123 }
    let(:price)               { 1.23 }


    before do
      allow(subject).to receive(:data_fetcher).and_return(data_fetcher)
      allow(subject).to receive(:data_parser).and_return(data_parser)
      allow(subject).to receive(:counter).and_return(counter)
    end

    it 'calculates the price' do
      subject.calculate

      expect(subject.price).to eq(price)
    end

    it 'calls fetch_data->parse_data->count_elemetns->count_price' do
      expect(subject).to receive(:fetch_data).and_return(data)
      expect(subject).to receive(:parse_data).and_return(parsed_data)
      expect(subject).to receive(:count_elemetns).and_return(number_of_elements)
      expect(subject).to receive(:count_price).and_return(price)

      subject.calculate
    end
  end
end
