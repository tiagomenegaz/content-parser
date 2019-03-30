require 'rails_helper'

RSpec.describe Contents::Creator do
  subject { described_class }
  let(:params) { { page: Page.new(original_url: 'http://example.com/') } }

  context 'initialization' do
    context 'with missing required fields' do
      context 'when page is missing' do
        it { expect { subject.new({}) }.to raise_error(KeyError, 'key not found: :page') }
      end
    end

    context 'with all required fields supplied' do
      it { expect { subject.new(params) }.not_to raise_error }
    end
  end

  context '#call' do
    before do
      response = [
        {:kind=>"h1", :value=>"Example Domain"},
        {:kind=>"a", :value=>"http://www.iana.org/domains/example"}
      ]
      allow_any_instance_of(Contents::Parser).to receive(:call).and_return(response)
    end

    it 'returns correct array' do
      service  = subject.new(params)

      expect {
        service.call
      }.to change { Content.count }.from(0).to(2)
    end
  end
end

