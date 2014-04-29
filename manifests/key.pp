define useradd::key {
  notify {"In useradd::key.pp":}
  if is_hash($name) {
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    if !has_key($name, 'name') {
      $name['name'] = "$name@puppet"
    }
    notify {$name['name']:}
    notify {$name['type']:}
    notify {$name['key']:}
  }
}