function ll --wraps=ls --wraps='eza -l --group-directories-first --icons -l -a -a -b -h -H -i -m' --description 'alias ll eza -l --group-directories-first --icons -l -a -a -b -h -H -i -m'
  eza -l --group-directories-first --icons -l -a -a -b -h -H -i -m $argv
        
end
