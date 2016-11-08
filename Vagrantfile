ENV['VAGRANT_DEFAULT_PROVIDER'] = 'google'

Vagrant.configure('2') do |config|
  config.vm.box = 'google/gce'
  config.vm.define 'workspace' do |workspace|
    workspace.vm.provider :google do |google, override|
      google.google_project_id = 'secret-project'
      google.google_client_email = 'secret@secret'
      google.google_json_key_location = "#{ENV['HOME']}/etc/keys/secret.json"

      google.preemptible = true
      google.auto_restart = false
      google.on_host_maintenance = 'TERMINATE'

      override.ssh.username = 'user'
      override.ssh.private_key_path = "#{ENV['HOME']}/.ssh/secret@secret"
    end

    workspace.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = 'chef/cookbooks'
      chef.add_recipe 'user'
    end
  end
end
