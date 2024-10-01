function monitor --wraps='arandr & disown > /dev/null' --description 'alias monitor arandr & disown > /dev/null'
  arandr & disown > /dev/null $argv
        
end
