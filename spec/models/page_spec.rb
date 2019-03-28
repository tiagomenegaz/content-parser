require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    context 'with missing required fields' do
      it { expect(Page.new.valid?).to be_falsey }
    end

    context 'with all required fields supplied' do
      let(:params) { { original_url: 'http://example.com/' } }

      it { expect(Page.new(params).valid?).to be_truthy }
    end
  end
end
