set :stage, :production

set :deploy_to, -> { "/home/user/public_html/#{fetch(:application)}" }

# Url of the WordPress root installation on the remote server (used by search-replace command)
set :wpcli_remote_url, -> { "//#{fetch(:production_domain)}" }

# Define web role to connect to the remote server
# [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
server "#{fetch(:production_domain)}", user: 'web', roles: %w{web},

ssh_options: {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}
