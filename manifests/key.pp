define useradd::key {
  if is_hash($name) {
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    if !has_key($name, 'name') {
      $name['name'] = "$name@puppet"
    }
    notice($name['name'])
    notice($name['type'])
    notice($name['key'])
  }
}