# Define: useradd
#
# A puppet module for adding users
#
# Extends existing functions to perform tasks such as adding SSH keys in a
# simplified way.
#
# SSH keys can be added as an array of hashes as follows:
#
# keys => [
#   {
#     key => 'AAAAAAAA',
#     type => 'ssh-rsa',
#     name => 'phil@codacity.co.uk',
#   }
# ]
#
# The type and name are optional and will default to ssh-rsa and
# username@puppet if ommitted.
define useradd (
  $ensure = present,
  $comment = '',
  $password = '!',
  $shell = '/bin/bash',
  $managehome = true,
  $home = undef,
  $keys = []
) {
  # Add user account
  user { $title:
    ensure => $ensure,
    comment => $comment,
    password => $password,
    shell => $shell,
    managehome => $managehome,
    home => $home,
  }
  
  # Add SSH keys
  if $ensure == present and $keys  {
    $home_real = $home ? {
      undef => "/home/${title}",
      default => $home,
    }
    file { "${home_real}/.ssh": 
      ensure => directory,
      owner => $title,
      group => $title,
      mode => 700,
      require => User[$title],
    }
    useradd::key { $keys:
      user => $title,
      require => File["${home_real}/.ssh"],
    }
  }

}