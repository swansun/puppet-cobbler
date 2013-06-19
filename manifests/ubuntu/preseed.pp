# Build a preseed file for Ubuntu for Cobbler

define cobbler::ubuntu::preseed(
  $packages = '',
  $early_command = false, # runs before install
  $late_command = false, # runs after install, before PXE is disabled
  $proxy = '',
  $ntp_server = undef,
  $admin_user = 'localadmin',
  $password_crypted = '',
  $expert_disk = false,
  $diskpart = [],
  $time_zone = 'UTC',
  $boot_disk = undef,
  $autostart_puppet = true,
  $root_part_size = 65536,
  $var_part_size = 524288,
) {
    if ( ! defined(File['/etc/cobbler/preseeds'])) {
        file { "/etc/cobbler/preseeds":
            ensure => directory
        }
    }

    file { "/etc/cobbler/preseeds/${name}":
        content => template("cobbler/preseed.erb")
    }
}
