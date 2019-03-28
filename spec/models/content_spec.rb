require 'rails_helper'

RSpec.describe Content, type: :model do
  subject { described_class }

  context 'validations' do
    context 'with missing required fields' do
      it { expect(subject.new.valid?).to be_falsey }
      it { expect(subject.new(kind: 'h1').valid?).to be_falsey }
      it { expect(subject.new(value: 'Some text').valid?).to be_falsey }
    end

    context 'with all required fields supplied' do
      let(:page_id) { Page.create(original_url: 'example.com').id }
      let(:params) { { value: 'Some text', kind: 'h1', page_id: page_id } }

      it { expect(subject.new(params).valid?).to be_truthy }
    end

    context 'with invalid kind enum type' do
      it { expect { subject.new(kind: 'foo') }.to raise_error(ArgumentError, "'foo' is not a valid kind") }
    end
  end

  context 'associations' do
    it 'belongs to page' do
      assc = described_class.reflect_on_association(:page)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
