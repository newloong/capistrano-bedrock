set :stage, :development


# Define dev role to connect to the local vagrant server
# [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
server "#{fetch(:development_domain)}", user: 'vagrant', roles: %w{dev},

ssh_options: {
  keys: ["../#{fetch(:trellis_folder)}/.vagrant/machines/default/virtualbox/private_key"],
  forward_agent: true,
  auth_methods: %w(publickey)
}

# Set the local vagrant development path where the project lives
set :dev_path, -> {"/srv/www/#{fetch(:bedrock_folder)}/current"}
