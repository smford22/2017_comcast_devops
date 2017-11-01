title 'NFS Controls'

control 'nfs-1.1' do
  impact 1.0
  title '4.6 Ensure nfs server is not running'
  desc 'Mac OS X can act as an NFS fileserver. NFS sharing could be enabled to
  allow someone on another computer to mount shares and gain access to
  information from the users computer. File sharing from a user endpoint has
  long been considered questionable and Apple has removed that capability from
  the GUI. NFSD is still part of the Operating System and can be easily turned
  on to export shares and provide remote connectivity to an end user computer.'

  describe service('nfsd') do
    it { should_not be_running }
  end

  describe file('/etc/exports') do
    it { should_not be_directory }
  end
end
