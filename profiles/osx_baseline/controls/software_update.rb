# title 'Software Update Configuration'

# control 'software-updates-1.0' do
#   impact 1.0
#   title '1.2 Enable Auto Update (Scored)'
#   desc 'Auto Update verifies that your system has the newest security patches and software
#   updates. If "Automatically check for updates" is not selected background updates for new
#   malware definition files from Apple for XProtect and Gatekeeper will not occur.
#   http://macops.ca/os-x-admins-your-clients-are-not-getting-background-security-updates/
#   https://derflounder.wordpress.com/2014/12/17/forcing-xprotect-blacklist-updates-onmavericks-and-yosemite/'

#   describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate') do
#     its('stdout') { should match(/AutomaticCheckEnabled/) }
#   end 
# end

