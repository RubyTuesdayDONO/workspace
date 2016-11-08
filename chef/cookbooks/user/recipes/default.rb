#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'ruby'
package 'git'
package 'rubygems'

# gem 'vagrant'
# gem 'packer'
# gem 'test-kitchen'

user ='reuben'

['~/src/com'].each do |dir|
  directory dir.gsub(/^~/, "/home/#{user}") do
    recursive true
  end
end
