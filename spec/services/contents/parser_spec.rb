require 'rails_helper'

RSpec.describe Contents::Parser do
  subject { described_class }
  let(:params) { { base_url: 'http://example.com/' } }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when base url is missing' do
        it {
          expect { subject.new({}) }.to raise_error(KeyError, 'key not found: :base_url')
        }
      end
    end

    context 'with all required fields supplied' do

      it { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    it 'returns correct array' do
      service  = subject.new(params)
      expected = [
        {:kind=>"h1", :value=>"Example Domain"},
        {:kind=>"a", :value=>"http://www.iana.org/domains/example"}
      ]
      expect(service.call).to match_array(expected)
    end
  end
end

