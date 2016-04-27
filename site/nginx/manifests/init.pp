class nginx {
  
  # Package
  package { 'nginx':
    ensure => present,
  }
  
  # Docroot
  file { '/var/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  
  # Index Page
  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/nginx/index.html",
  }
  
  # Configuration Files
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/nginx/nginx.conf",
    require => 'nginx',
    notify  => 'nginx',
  }
  
  file { '/etc/nginx/default.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/nginx/default.conf",
    require => 'nginx',
    notify  => 'nginx',
  }

  # service
  service { nginx:
    ensure => running,
    enable => true,
  }
  
}
