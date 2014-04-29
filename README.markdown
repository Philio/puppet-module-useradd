# useradd #

A puppet module for adding users

Extends existing functions to perform tasks such as adding SSH keys in a simplified way.

SSH keys can be added as an array of hashes as follows:

    useradd { 'phil':
      keys => [  
        {  
          key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCi8+wR3SrNXcRpoyM73CpYL5zPZ+w4uVyHVvYgR76d6GHEQDnWwp1Ln0B5mkKLxbC+enum0sfi5wX//tZW0E+JV34NlruJ4dsFkAY6wwpqKJTv3lUZwJvYD72mexyHMQ0VJ510KFHGVhil/XIk0MnvFPOq904DzS4pYGhUn2QSTThyk7XWc6NZFEX9PMsvtoBnPv7mGi/x9XWqGOsEKTV8s+uO/B09fy/vZkUu1ze/dHitrcZVDHVZVwT+6T3g3K/IY5Cz+acbyFHs/yoXk9RgVafNTTkvTeufTeRc8cWIfX9oHY8pinw5kTx9pNlQwtSKz+hihCnBRk/Y8NZPBQHl',  
          type => 'ssh-rsa',  
          name => 'phil@codacity.co.uk',  
        }  
      ]
    }

The type and name are optional and will default to ssh-rsa and username@puppet if ommitted.

Currently the contents of each key hash must be unique, the easiest way to avoid problems is to use a unique name for each key.