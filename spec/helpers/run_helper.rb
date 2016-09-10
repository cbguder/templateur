class RunHelper
  def self.run(*args)
    bin_path = File.absolute_path(File.join(__dir__, '..', '..', 'bin', 'templateur'))
    cmd = args.unshift(bin_path).join(' ')
    system(cmd)
  end
end
