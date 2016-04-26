class memcached {

  package {'memcached':
    ensure => present,
  }
  
  file {'/etc/sysconfig/memcached':
    ensure => file,
    soure => 'puppet:///modules/memcached/memcached',
    owner   => 'root',
    group   => 'root',
    mode   => '755',
    require => Package['memcached'],
  }
  
  service {'memcached':
    ensure => running,
    running => true,
    subscribe => File['/etc/sysconfig/memcached'],
  }

}
