# -*- mode: ruby -*-
# vi: set ft=ruby :
WORKERS_COUNT = "2"

cluster = {
  "kubemaster" => { :ip => "192.168.99.20", :cpus => 6, :mem => 8192, :role => "master"},
  "worker1" => { :ip => "192.168.99.21", :cpus => 6, :mem => 8192, :role => "worker" },
  "worker2" => { :ip => "192.168.99.22", :cpus => 6, :mem => 8192, :role => "worker"}
}

roles = {}
vars = {}
cluster.each_with_index do |(hostname, info), index|
# sort machine by roles
  if roles.has_key?(info[:role])
    roles[info[:role]].push(hostname)
  else
    roles[info[:role]] = [hostname]
  end
  addr = "host_main_ip=#{info[:ip]}"
  if vars.has_key?(hostname)
    vars[hostname].push(addr)
  else
    vars[hostname] = [addr]
  end
end
roles["kubeapi"] = ["kubemaster"]

Vagrant.configure("2") do |config|
  cluster.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |config|
      config.vm.hostname = hostname
      config.vm.box = "ubuntu/focal64"
      config.vm.network "private_network", ip: "#{info[:ip]}"
      config.vm.provider "virtualbox" do |vb|
        vb.memory = info[:mem]
        vb.cpus = info[:cpus]
        vb.name = hostname
      end
    end
  end
  #Start Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.groups = roles
    ansible.host_vars = vars
    ansible.playbook = "playbook.init.yml"
  end
end
