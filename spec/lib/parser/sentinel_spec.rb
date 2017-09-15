require 'spec_helper'

describe Mtx::Parser::Sentinel do
  it_behaves_like 'a parser' do
    subject { Mtx::Parser::Sentinel.new('sentinels') }
  end
end
