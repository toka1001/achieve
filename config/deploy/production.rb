server '54.95.209.21', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/ubuntu/.ssh/id_rsa'
# set :ssh_options, keys: '/Users/toka/.ssh/id_rsa'