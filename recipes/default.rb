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
# cookbook_file '/opt/tomcat_helloworld/webapps/sample.war' do
#   source 'sample.war'
#   owner 'tomcat_helloworld'
#   group 'tomcat_helloworld'
#   mode '0755'
#   action :create
# end

#deploy the second app
#create the config directory
directory '/opt/config' do
  owner 'tomcat_helloworld'
  group 'tomcat_helloworld'
  mode '0755'
  action :create
end

#set the application property file
template '/opt/config/application.properties' do
  source 'application.properties.erb'
  owner 'tomcat_helloworld'
  group 'tomcat_helloworld'
  mode 0755
end

#get the war file
remote_file "/opt/tomcat_helloworld/webapps/user-v1.war" do
   source "https://s3-us-west-2.amazonaws.com/opswork-nitish/user_api-1.0-SNAPSHOT.war"
   owner 'tomcat_helloworld'
   group 'tomcat_helloworld'
   mode 0755
   action :create_if_missing
end

#start the app
tomcat_service 'helloworld' do
  action :start
  env_vars [{ 'CATALINA_PID' => '/my/special/path/tomcat.pid' }]
end
