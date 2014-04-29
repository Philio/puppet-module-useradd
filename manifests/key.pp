define useradd::key ($key = '', $key_type = 'ssh-rsa', $key_name = '') {
  notify {"In useradd::key.pp":}
  if is_hash($name) {
    # If type is defined set it
    if has_key($name, 'type') {
      $key_type = $name['type']
    }
    
    # If key name is defined set it
    if !has_key($name, 'name') {
      $key_name = "${name['name']}@puppet"
    }
  }
  
  notify {$key:}
  notify {$key_type:}
  notify {$key_name:}
}