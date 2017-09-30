autocmd BufWritePre * %s/\s\+$//e
"autocmd BufWritePost *.exs silent :!mix format %
"autocmd BufWritePost *.ex silent :!mix format %

