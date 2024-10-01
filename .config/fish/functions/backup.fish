function backup --wraps='sudo timeshift' --description 'alias backup sudo timeshift'
  sudo timeshift $argv
        
end
