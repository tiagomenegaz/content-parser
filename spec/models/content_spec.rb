require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'validations' do
    context 'with missing required fields' do
      it { expect(Content.new.valid?).to be_falsey }
      it { expect(Content.new(kind: 'h1').valid?).to be_falsey }
      it { expect(Content.new(value: 'Some text').valid?).to be_falsey }
    end

    context 'with all required fields supplied' do
      let(:params) { { value: 'Some text', kind: 'h1' } }

      it { expect(Content.new(params).valid?).to be_truthy }
    end

    context 'with invalid kind enum type' do
      it { expect { Content.new(kind: 'foo') }.to raise_error(ArgumentError, "'foo' is not a valid kind") }
    end
  end
end
