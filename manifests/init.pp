# Define: useradd
#
# A puppet module for adding users
#
# Extends existing functions to perform tasks such as adding SSH keys in a
# simplified way.
define useradd (
  $name = $title,
  $comment = '',
  $shell = '/bin/bash',
  $create_home = true,
  $keys = []
) {
  each($keys) |$key| {
    if is_hash($key) {
      if !has_key($key, 'type') {
        $key['type'] = 'ssh-rsa'
      }

      if !has_key($key, 'name') {
        $key['name'] = "$name@puppet"
      }

      notice($key['key'])
      notice($key['name'])
      notice($key['type'])
    }
  }
}