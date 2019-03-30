require 'rails_helper'

RSpec.describe Contents::Parser do
  subject { described_class }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when base url is missing' do
        xit { expect { subject.new() }.not_to raise_error }
      end
    end

    context 'with all required fields supplied' do
      let(:params) { { base_url: 'http://example.com/' } }

      xit { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    xit 'returns nil'
  end
end

