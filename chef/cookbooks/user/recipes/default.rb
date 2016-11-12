#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


node.deep_fetch(*%w(system principals)).each do |user|
  node.deep_fetch(*%w(user directories)).each do |dir|
    directory dir.gsub(/^~/, "/home/#{user}") do
      recursive true
    end
  end
end
