function pdf-merge --wraps='qpdf --empty --pages' --description 'alias pdf-merge qpdf --empty --pages'
  qpdf --empty --pages $argv
        
end
