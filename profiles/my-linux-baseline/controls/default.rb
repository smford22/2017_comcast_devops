# encoding: utf-8
# copyright: 2015, The Authors

title 'default controls'

include_controls 'linux-baseline' do
  skip_control 'os-08'
  skip_control 'os-10'
end