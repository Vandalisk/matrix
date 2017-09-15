require 'spec_helper'

describe Mtx::Parser::Sniffer do
  it_behaves_like 'a parser' do
    subject { Mtx::Parser::Sniffer.new('sniffers') }
  end
end
