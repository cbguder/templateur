require 'rspec'
require_relative '../helpers/run_helper'

describe 'Usage' do
  def run(*args)
    bin_path = File.absolute_path(File.join(__dir__, '..', '..', 'bin', 'templateur'))
    cmd = args.unshift(bin_path).join(' ')
    system(cmd)
  end

  it 'prints usage when called with no arguments' do
    success = false

    expect {
      success = RunHelper.run()
    }.to output(/USAGE: templateur/).to_stderr_from_any_process

    expect(success).to be_falsey
  end

  it 'prints usage when called with not enough arguments' do
    success = false

    expect {
      success = RunHelper.run('template', 'parameters')
    }.to output(/USAGE: templateur/).to_stderr_from_any_process

    expect(success).to be_falsey
  end
end
