require 'spec_helper'
require 'mtx'

RSpec.describe Mtx do
  let(:params) do
    {
      endpoint: URI.unescape(Mtx::MatrixGateway.get_endpoint),
      passphrase: URI.unescape(ENV['PASSPHRASE'])
    }
  end

  before(:each) { @result = Mtx.call }

  let(:files) do
    Mtx::Config::SOURCE_NAMES.map do |entry|
      "#{entry}.zip"
    end.sort
  end

  it 'status Ok' do
    VCR.use_cassette('matrix', erb: params, record: :once) do
      expect(@result).to eq('OK')
    end
  end

  it 'saves binary files' do
    tmp_dir = File.expand_path("../../../tmp", __FILE__)

    expect((Dir.entries(tmp_dir) & files).sort).to eq(files)
  end

  it 'unzips binary files' do
    Mtx::Config::SOURCE_NAMES.each do |src|
      tmp_dir = File.expand_path("../../../tmp/#{src}", __FILE__)

      expect(Dir.entries(tmp_dir).count).to be > 0
    end
  end
end
