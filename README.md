# in_demo

##This is a wrapper Cookbook, which installs java (1.8 jdk) and configures tomcat (v8). Upon the execution of cookbook, the notification will be sent to slack/hipchat. 
For now the configuration is set to send the notification to slack.

````
Atttribute options:
You can pick either hipchat or slack notification hooks.
default[:run_notifier][:hipchat][:enabled] = <true|false> 
default[:run_notifier][:slack][:enabled] = <true|false>
````
###Step-1: 
installs java 8

###Step-2
Installs TOmcat 8

###Step-3 
Deploy the sample app
````
tomcat_install 'helloworld' do
  version '8.0.36'
end
````
###Step-4
Start the app server

###Step-5
Referenced the notification module at the begining
