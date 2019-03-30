require 'rails_helper'

RSpec.describe Logs::Register do
  subject { described_class }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when url is missing' do
        it {
          expect { subject.new({})
        }.to raise_error(KeyError, 'key not found: :url') }
      end

      context 'when message is missing' do
        it {
          expect { subject.new(ulr: 'http://example.com/')
        }.to raise_error(KeyError, 'key not found: :url') }
      end
    end

    context 'with all required fields supplied' do
      let(:params) { { url: 'http://example.com/', message: 'Something went wrong' } }

      it { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    let(:params) { { url: 'http://example.com/', message: 'Something went wrong' } }

    it 'returns correct array' do
      service  = subject.new(params)
      expected = [
        "---"*20,
        "The following page has content that clouldn't be parsed http://example.com/",
        "Error Something went wrong",
        "Registered at #{DateTime.now}",
        "---"*20
      ]
      expect(service.call).to match_array(expected)
    end
  end
end
