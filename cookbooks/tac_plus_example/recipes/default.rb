#
# Cookbook:: tac_plus_example
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
# Cookbook:: 2017_comcast_devops
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
yum_repository 'nux-misc' do
  description 'Nux! Repo'
  baseurl 'http://li.nux.ro/download/nux/misc/el6/x86_64/'
  gpgkey 'http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro'
  enabled true
  action :create
end

package 'tac_plus' do
  action :install
end

directory '/etc/tac_plus'

template '/etc/tac_plus/tac_plus.conf' do
  source 'tac_plus.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end