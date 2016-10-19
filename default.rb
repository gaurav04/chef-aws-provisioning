chef_gem "chef-provisioning-aws" do
 compile_time false
    action :install
end

require 'chef/provisioning/aws_driver'

with_driver 'aws'
with_chef_server "<server url >",
 :client_name => Chef::Config[:node_name],
 :signing_key_filename => Chef::Config[:client_key]

with_machine_options({
    convergence_options: {
        allow_overwrite_keys: true,
        :ssl_verify_mode => :verify_none
    },
   bootstrap_options: {
   image_id: "ami-2d39803a", # default for us-east-1
   key_name: "<key-name>", # If not specified, this will be used and generated
   key_path: "<key-path>", # only necessary if storing keys some other location
 },
 ssh_username: 'ubuntu',
 
 :transport_address_location => :public_dns_name,
 :sudo => true
})

# commented for safty
machine "provisioner" do
    recipe 'terra'
    action :converge
end
