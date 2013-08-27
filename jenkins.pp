Package { ensure => latest, }

if ! defined(Package['java-1.7.0-openjdk-devel']) { package { 'java-1.7.0-openjdk-devel': } }
if ! defined(Package['dejavu-sans-fonts']) { package { 'dejavu-sans-fonts': } }
if ! defined(Package['fontconfig']) { package { 'fontconfig': } }
if ! defined(Package['git']) { package { 'git': } }

class { 'jenkins':
  config_hash  => {
    'JVM_OPTS' => { 'value' => '-Djava.awt.headless=true' },
  },
  plugin_hash => {
    'git'     => {},
  },
}

service { ['iptables', 'ip6tables' ]:
  ensure  =>  stopped,
}
