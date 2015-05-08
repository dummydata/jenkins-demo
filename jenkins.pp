Package { ensure => latest, }

if ! defined(Package['dejavu-sans-fonts']) { package { 'dejavu-sans-fonts': } }
if ! defined(Package['fontconfig']) { package { 'fontconfig': } }
if ! defined(Package['git']) { package { 'git': } }

class { 'jenkins':
  config_hash  => {
    'JVM_OPTS' => { 'value' => '-Djava.awt.headless=true' },
  },
  plugin_hash => {
    'git'             => {},
    'scm-api'         => {},
    'git-client'      => {},
    'credentials'     => {},
    'ssh-credentials' => {},
    'job-dsl'         => {},
  },
}

service { ['iptables', 'ip6tables' ]:
  enable  => false,
  ensure  => stopped,
}
