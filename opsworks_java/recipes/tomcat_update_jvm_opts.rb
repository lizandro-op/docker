tomcat_env_config_file = case node[:platform]
                         when "redhat" then ::File.join(node["opsworks_java"]["tomcat"]["system_env_dir"], "tomcat")
                         else ::File.join(node["opsworks_java"]["tomcat"]["system_env_dir"], "tomcat#{node["opsworks_java"]["tomcat"]["base_version"]}")
                         end

template 'tomcat environment configuration' do
  path tomcat_env_config_file
  source 'tomcat_env_config.erb'
  owner 'root'
  group 'root'
  mode 0644
  backup false
  notifies :restart, 'service[tomcat]'
end
