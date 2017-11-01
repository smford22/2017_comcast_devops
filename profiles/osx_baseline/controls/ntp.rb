title 'NTP Configuration'

control 'ntp-1.0' do
  impact 0.7
  title '2.2.1 Enable "Set time and date automatically" (Not Scored)'
  desc 'Correct date and time settings are required for authentication protocols, file creation,
  modification dates and log entries. Apple\'s automatic time update solution will enable an
  NTP server that is not controlled by the Application Firewall. Turning on \"Set time and date
  automatically\" allows other computers to connect to set their time and allows
  for exploit attempts against ntpd. It also allows for more accurate network detection and
  OS fingerprinting.'

  describe command('systemsetup -getusingnetworktime') do
    its('stdout') { should match(/Network Time: On/)}
  end
end

control 'ntp-1.2' do
  impact 1.0
  title 'NTP Should be configure to time.apple.com'
  desc 'All systems should be configured to use time.apple.com as the network time server'

  describe command('systemsetup -getnetworktimeserver') do
    its('stdout') { should match(/Network Time Server: time.apple.com/) }
  end
end