exec { 'curl -O http://pkg.jenkins-ci.org/redhat/jenkins.repo':
  cwd		 => '/etc/yum.repos.d/',
  creates => '/etc/yum.repos.d/jenkins.repo', 
  path    => ['/usr/bin', '/usr/sbin'],
  before  => Package['jenkins'],
}

exec { 'rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key':
  path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  before  => Package['jenkins'],
}

package { ['java-1.7.0-openjdk-devel', 'jenkins']:
  ensure => latest,
}

service { 'jenkins':
  ensure  => running,
  require => Package['jenkins', 'java-1.7.0-openjdk-devel'],
}

service { ['iptables', 'ip6tables' ]:
  ensure  =>  stopped,
}
