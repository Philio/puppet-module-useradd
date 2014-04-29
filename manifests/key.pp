define useradd::key ($user) {
  if is_hash($name) {
    # If type is defined set it
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    
    # If key name is defined set it
    if !has_key($name, 'name') {
      $name['name'] = "${name['user']}@puppet"
    }
    
    notify {$name['user']:}
    notify {$name['type']:}
    notify {$name['key']:}
    notify {$name['name']:}
  }
}