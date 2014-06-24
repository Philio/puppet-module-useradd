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
#     key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCi8+wR3SrNXcRpoyM73CpYL5zPZ+w4uVyHVvYgR76d6GHEQDnWwp1Ln0B5mkKLxbC+enum0sfi5wX//tZW0E+JV34NlruJ4dsFkAY6wwpqKJTv3lUZwJvYD72mexyHMQ0VJ510KFHGVhil/XIk0MnvFPOq904DzS4pYGhUn2QSTThyk7XWc6NZFEX9PMsvtoBnPv7mGi/x9XWqGOsEKTV8s+uO/B09fy/vZkUu1ze/dHitrcZVDHVZVwT+6T3g3K/IY5Cz+acbyFHs/yoXk9RgVafNTTkvTeufTeRc8cWIfX9oHY8pinw5kTx9pNlQwtSKz+hihCnBRk/Y8NZPBQHl',
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
    ensure     => $ensure,
    comment    => $comment,
    password   => $password,
    shell      => $shell,
    managehome => $managehome,
    home       => $home,
  }
  
  # Add SSH keys
  if $keys {
    $home_real = $home ? {
      undef => "/home/${title}",
      default => $home,
    }
    file { "${home_real}/.ssh": 
      ensure => directory,
    }
    useradd::key { $keys:
      user => $title,
      require => File["${home_real}/.ssh"],
    }
  }

}