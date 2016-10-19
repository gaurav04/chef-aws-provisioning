# chef-aws-provisioning

In knife.rb add following line :

    knife[:aws_ssh_key_id] = '<key_name>'
    private_keys     '<key-name>' => '<path-of-key>' # which one we use to access ec2 instance
    knife[:ssh_user] = "ubuntu"
    
copy <key_name> to /root/.ssh/ folder

run 'aws configure' command 
