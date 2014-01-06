class n98magerun(
  $php_package = 'php5-cli',
  $install_dir = '/usr/local/bin',
  $stable      = true
) {

  if $stable {
    $download_path = 'https://raw.github.com/netz98/n98-magerun/master/n98-magerun.phar'    
  } else {
    $download_path = 'https://raw.github.com/netz98/n98-magerun/develop/n98-magerun.phar'    
  }
   
  exec { 'download n98-magerun':
    command     => "curl -o n98-magerun.phar ${download_path}",
    creates     => "${install_dir}/n98-magerun.phar",
    cwd         => $install_dir,
    require     => [
      Package['curl', $php_package]
    ]
  }

  file { 'n98-magerun.phar':
    path    => "${install_dir}/n98-magerun.phar",
    mode    => '0755',
    owner   => root,
    group   => root,
    require => Exec['download n98-magerun']
  }
}
