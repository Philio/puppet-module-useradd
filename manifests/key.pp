define useradd::key ($key_user) {
  if is_hash($name) {
    # If type is defined set it
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    
    # If key name is defined set it
    if !has_key($name, 'name') {
      $name['name'] = "$key_user@puppet"
    }
    
    notify {$name['type']:}
    notify {$name['key']:}
    notify {$name['name']:}
  }
}