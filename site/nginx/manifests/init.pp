class nginx {
  
  $document_root = '/var/www'
  $config_base_path = '/etc/nginx'
  $package_name = 'nginx'
  $service_name = 'nginx'
  
  # Resource Defaults
  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  
  # Package
  package { $package_name:
    ensure => present,
  }
  
  # Docroot
  file { $document_root:
    ensure => directory,
  }
  
  # Index Page
  file { "${document_root}/index.html":
    source => "puppet:///modules/nginx/index.html",
  }
  
  # Configuration Files
  file { "${config_base_path}/nginx.conf":
    source => "puppet:///modules/nginx/nginx.conf",
    require => Package[$package_name],
    notify  => Service[$service_name],
  }
  
  file { "${config_base_path}/default.conf":
    source => "puppet:///modules/nginx/default.conf",
    require => Package[$package_name],
    notify  => Service[$service_name],
  }

  # service
  service { $service_name:
    ensure => running,
    enable => true,
  }
  
}
