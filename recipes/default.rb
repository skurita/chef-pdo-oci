#
# Cookbook Name:: php_oci
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "pdo_oci.so" do
  owner "root"
  group "root"
  mode 0744
  path "#{node[:pdo_oci][:extension_dir]}/pdo_oci.so"
  action :create_if_missing
end

template "#{node[:pdo_oci][:conf_dir]}/pdo_oci.ini" do
  owner "root"
  group "root"
  mode 0644
  source "pdo_oci.ini.erb"
  not_if {File.exists?("#{node[:pdo_oci][:conf_dir]}/pdo_oci.ini")}
end
