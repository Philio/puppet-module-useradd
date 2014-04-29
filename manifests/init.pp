# Define: useradd
#
# A puppet module for adding users
#
# Extends existing functions to perform tasks such as adding SSH keys in a
# simplified way.
define useradd (
  $user = $title,
  $comment = '',
  $shell = '/bin/bash',
  $create_home = true,
  $keys = []
) {
  useradd::key { $keys:
    user => $user,
  }
}