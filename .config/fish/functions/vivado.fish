function vivado --description 'alias vivado vivado -nolog -nojournal & disown > /dev/null'
 command vivado -nolog -nojournal & disown > /dev/null $argv
        
end
