define useradd::key {
  notify {"In useradd::key.pp":}
  if is_hash($name) {
    # If type isn't set default to RSA
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    
    # If key name isn't set generate one
    if !has_key($name, 'name') {
      $name['name'] = "$name[name]@puppet"
    }
    notify {$name['undef']:}
    notify {$name['name']:}
    notify {$name['type']:}
    notify {$name['key']:}
  }
}