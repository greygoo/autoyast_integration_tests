Veewee::Session.declare({
  :os_type_id  => 'OpenSUSE_64',
  :cpu_count   => '1',
  :memory_size => '1024',
  :disk_size   => '40480',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :iso_file => 'SLE-12-Server-DVD-x86_64-Build0894-Media1.iso',
  :iso_src  => 'http://download.suse.de/install/SLE-12-UNTESTED/SLE-12-Server-DVD-x86_64-Build0894-Media1.iso',
  :iso_md5  => '70e7a1706da3c462f2107128b613b977',
  :iso_download_timeout => '1000',
  :boot_wait         => '10',
  :boot_cmd_sequence => [
      '<Esc><Enter>',
      'linux netdevice=eth0 netsetup=dhcp net.ifnames=0 install=cd:/',
      ' lang=en_US',
      ' autoyast=http://%IP%:8888/autoinst.xml',
      ' insecure=1 textmode=1',
      '<Enter>'
  ],
  :ssh_login_timeout => '10000',
  :ssh_user          => 'root',
  :ssh_password      => 'vagrant',
  :ssh_key           => '',
  :ssh_host_port     => '7222',
  :ssh_guest_port    => '222',
  :sudo_cmd     => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => 'halt',
  :postinstall_files   => ["postinstall.sh"],
  :postinstall_timeout => '10000',
  :hooks => {
      :before_create => Proc.new do
        puts "Assembly started at #{Time.now}"
        path = "#{Dir.pwd}/definitions/#{definition.box.name}"
        Thread.new { WEBrick::HTTPServer.new(:Port => 8888, :DocumentRoot => path).start }
      end
  }
})
