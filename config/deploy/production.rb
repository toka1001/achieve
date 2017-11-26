server '13.230.59.240', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/toka/.ssh/id_rsa'