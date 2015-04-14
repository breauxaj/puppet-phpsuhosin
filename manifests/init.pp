class phpsuhosin {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-suhosin' ],
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php' ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'httpd' ],
  }

  package { $required:
    ensure  => latest,
    require => Package[$depends],
    notify  => Service[$service],
  }

}
