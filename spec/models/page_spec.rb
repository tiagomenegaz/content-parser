require 'rails_helper'

RSpec.describe Page, type: :model do
  subject { described_class }

  context 'validations' do
    context 'with missing required fields' do
      it { expect(subject.new.valid?).to be_falsey }
    end

    context 'with all required fields supplied' do
      let(:params) { { original_url: 'http://example.com/' } }

      it { expect(subject.new(params).valid?).to be_truthy }
    end
  end

  context 'associations' do
    it 'has many content' do
      assc = described_class.reflect_on_association(:contents)
      expect(assc.macro).to eq :has_many
    end
  end
end
