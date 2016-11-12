case ENV['VAGRANT_DEFAULT_PROVIDER']
when 'google'
  require 'json'
  gce_config = JSON.parse(File.read(ENV['GCE_CONFIG']))
  gce_config['json_path'] = ENV['GCE_CONFIG']
  Vagrant.configure('2') do |config|
    config.vm.box = 'google/gce'
    config.vm.define 'workspace' do |workspace|
      workspace.vm.provider :google do |google, override|
        google.google_project_id = gce_config['project_id']
        google.google_client_email = gce_config['client_email']
        google.google_json_key_location = gce_config['json_path']

        google.image = 'centos-7-v20161027'
        google.preemptible = true
        google.machine_type = 'g1-small'
        google.auto_restart = false
        google.on_host_maintenance = 'TERMINATE'

        override.ssh.username = ENV['SSH_USERNAME']
        override.ssh.private_key_path = ENV['SSH_KEY_PATH']
        override.ssh.pty = true
      end

      workspace.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = 'chef/cookbooks'
        chef.roles_path = 'chef/roles'
        chef.add_role 'workspace'
      end
      workspace.vm.provision :serverspec do |spec|
        spec.pattern = 'chef/spec/*_spec.rb'
      end
    end
    config.trigger.after :destroy do
      # do something to remove the known_hosts key --
      # need to figure out to read provider state
    end
  end
end
