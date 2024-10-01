function firewall --wraps='sudo ufw' --description 'alias firewall sudo ufw'
  sudo ufw $argv
        
end
