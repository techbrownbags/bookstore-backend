require 'rails_helper'

describe JwtService do
  subject { described_class }

  let(:payload) { { 'one' => 'two' } }
  let(:token) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJvbmUiOiJ0d28ifQ.aYYqP5H6hnFGbHzSRjar7f5a8RitqSeMsmstYSbIAf0'}

  describe '.encode' do
    it { expect(subject.encode(payload)).to eq(token) }
  end

  describe '.decode' do
    it { expect(subject.decode(token)).to eq(payload) }
  end
end