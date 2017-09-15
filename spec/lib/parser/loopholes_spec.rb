require 'spec_helper'

describe Mtx::Parser::Loophole do
  it_behaves_like 'a parser' do
    subject { Mtx::Parser::Loophole.new('loopholes') }
  end
end
