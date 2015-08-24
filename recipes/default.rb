#
# Cookbook Name:: mysql-setup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_connection_info = {
  host:     node[:mysql][:bind_address],
  username: 'root',
  password: node[:mysql][:server_root_password]
}

mysql_service node[:mysql][:instance_name] do
  version node[:mysql][:versioon]
  bind_address node[:mysql][:bind_address]
  initial_root_password node[:mysql][:server_root_password]
  action [ :create, :start ]
end

mysql_client node[:mysql][:instance_name] do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end

node[:mysql][:users].each do |user_info|
  mysql_database_user user_info[:name] do
    connection mysql_connection_info
    password user_info[:password]
    action :create
  end
end
