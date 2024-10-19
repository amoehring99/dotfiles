function ubuntu --wraps='distrobox enter --root ubuntu-22-04' --description 'alias ubuntu=distrobox enter --root ubuntu-22-04'
  distrobox enter --root ubuntu-22-04 $argv
        
end
