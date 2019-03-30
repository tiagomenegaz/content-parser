require 'rails_helper'

RSpec.describe Logs::Register do
  subject { described_class }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when url is missing' do
        xit { expect { subject.new() }.not_to raise_error }
      end

      context 'when message is missing' do
        xit { expect { subject.new(ulr: 'http://example.com/') }.not_to raise_error }
      end
    end

    context 'with all required fields supplied' do
      let(:params) { { url: 'http://example.com/', message: 'Something went wrong' } }

      xit { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    xit 'returns nil'
  end
end
