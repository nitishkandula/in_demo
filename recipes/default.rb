#
# Cookbook Name:: in_demo
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

#for the notifications
include_recipe 'run-notifier'

#install java 8
package  'java-1.8.0-openjdk'

#install tomcat 8 'helloworld' to /opt/tomcat_helloworld_8_0_36/ with a symlink at /opt/tomcat_helloworld/
tomcat_install 'helloworld' do
  version '8.0.36'
end

#deploy sample app
cookbook_file '/opt/tomcat_helloworld/webapps/sample.war' do
  source 'sample.war'
  owner 'tomcat_helloworld'
  group 'tomcat_helloworld'
  mode '0755'
  action :create
end

#start the app
tomcat_service 'helloworld' do
  action :start
  env_vars [{ 'CATALINA_PID' => '/my/special/path/tomcat.pid' }]
end
