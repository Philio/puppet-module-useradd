# Define: useradd::key
define useradd::key ($user) {
  if is_hash($name) {
    # If type is defined set it
    if !has_key($name, 'type') {
      $name['type'] = 'ssh-rsa'
    }
    
    # If key name is defined set it
    if !has_key($name, 'name') {
      $name['name'] = "$user@puppet"
    }
    
    # If key is set then create the key
    if has_key($name, 'key') {
      ssh_authorized_key { "${user}_${type}_${name['name']}":
		    ensure => present,
		    user => $user,
		    type => $name['type'],
		    key => $name['key'],
		    name => $name['name'],
		    require => User[$user],
		  }
    }
  }
}