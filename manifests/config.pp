define phpsuhosin::config (
  $value
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-suhosin' ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'httpd' ],
  }

  $key = $title

  $context = '/files/etc/php.d/suhosin.ini'

  augeas { "suhosin_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    notify  => Service[$service],
    require => Package[$required],
  }

}
