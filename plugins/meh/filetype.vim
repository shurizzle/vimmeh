autocmd FileType lisp,ruby,yaml,javascript,haml,scss IndentationLocal 2
autocmd FileType markdown,man,git,gitcommit,diff,mail,objdasm,pdf,help,vimshell,rfc setlocal nolist nonu
autocmd FileType haml,scss setlocal noexpandtab
autocmd FileType haskell,lisp,markdown setlocal expandtab
autocmd FileType int-ghci setlocal syntax=haskell
autocmd FileType int-ripl,int-irb,int-rbx setlocal syntax=ruby
autocmd FileType int-python setlocal syntax=python
autocmd FileType int-clj setlocal syntax=clojure
autocmd FileType int-node setlocal syntax=javascript
autocmd FileType int-erl setlocal syntax=erlang

augroup filetypedetect
	autocmd BufRead,BufNewFile *.rbuild set ft=ruby
	autocmd BufRead,BufNewFile *.markdown set ft=markdown
	autocmd BufRead,BufNewFile *.yml set ft=yaml
	autocmd BufRead,BufNewFile *.asciidoc set ft=asciidoc
	autocmd BufRead,BufNewFile *.asd,*.cic set ft=lisp
	autocmd BufRead,BufNewFile *.json set ft=json
	autocmd BufRead,BufNewFile valgrind*.log set ft=valgrind
	autocmd BufRead,BufNewFile *rfc* set ft=rfc
augroup END

autocmd BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
autocmd BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -
