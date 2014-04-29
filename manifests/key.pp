define useradd::key ($key) {
  if is_hash($key) {
    if !has_key($key, 'type') {
      $key['type'] = 'ssh-rsa'
    }
    if !has_key($key, 'name') {
      $key['name'] = "$name@puppet"
    }
    notice($key['name'])
    notice($key['type'])
    notice($key['key'])
  }
}