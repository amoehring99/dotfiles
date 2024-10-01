function bt --wraps=printf\ \"devices\"\ \|\ bluetoothctl\ \|\ grep\ \"Device\"\ \&\&\ printf\ \"\\n\"\ \&\&\ bluetoothctl --description alias\ bt\ printf\ \"devices\"\ \|\ bluetoothctl\ \|\ grep\ \"Device\"\ \&\&\ printf\ \"\\n\"\ \&\&\ bluetoothctl
  printf "devices" | bluetoothctl | grep "Device" && printf "\n" && bluetoothctl $argv
        
end
