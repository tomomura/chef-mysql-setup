default[:mysql][:version] = '5.7'
default[:mysql][:server_root_password] = 'vagrant'
default[:mysql][:bind_address] = '0.0.0.0'
default[:mysql][:instance_name] = 'default'
default[:mysql][:users] = [
  { name: "vagrant", password: "vagrant" }
]
