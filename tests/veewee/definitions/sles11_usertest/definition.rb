Veewee::Definition.declare({
  :os_type_id  => 'OpenSUSE',
  :cpu_count   => '1',
  :memory_size => '1024',
  :disk_size   => '10240',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :iso_file => "SLES-11-SP3-DVD-i586-GM-DVD1.iso",
  :iso_src  => "http://schnell.suse.de/SLE11/iso/SLES-11-SP3-DVD-i586-GM-DVD1.iso",
  :iso_md5  => "5c30a409fc8fb3343b4dc90d93ff2c89",
  :iso_download_timeout => "1000",
  :boot_wait         => "10",
  :boot_cmd_sequence => [
    '<Esc><Enter>',
    'linux netdevice=eth0 netsetup=dhcp',
    ' install=http://10.120.0.100/install/SLP/SLES-11-SP3-GM/i386/DVD1/',
    ' lang=en_US autoyast=http://%IP%:8888/autoinst.xml',
    ' textmode=1',
    '<Enter>'
  ],
  :ssh_login_timeout => "10000",
  :ssh_user          => "root",
  :ssh_password      => "vagrant",
  :ssh_key           => "",
  :ssh_host_port     => "7222",
  :ssh_guest_port    => "22",
  :sudo_cmd     => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "shutdown -P now",
  :postinstall_files   => ["postinstall.sh", "usertest.sh"],
  :postinstall_timeout => "10000",
  :hooks => {
    # Before starting the build we spawn a webrick webserver which serves the
    # autoyast profile to the installer. veewee's built in webserver solution
    # doesn't work reliably with autoyast due to some timing issues.
    :before_create => Proc.new do
      path = "#{Dir.pwd}/definitions/#{definition.box.name}"
      Thread.new { WEBrick::HTTPServer.new(:Port => 8888, :DocumentRoot => path).start }
    end
  },
})
