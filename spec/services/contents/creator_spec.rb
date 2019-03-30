require 'rails_helper'

RSpec.describe Contents::Creator do
  subject { described_class }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when page is missing' do
        xit { expect { subject.new() }.not_to raise_error }
      end
    end

    context 'with all required fields supplied' do
      let(:params) { { page: Page.new(original_url: 'http://example.com/') } }

      xit { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    xit 'returns nil'
  end
end


