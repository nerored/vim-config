" Gopls config
if dein#tap('vim-go')
  autocmd FileType go LSP 'go'
endif

" ccls config
if dein#tap('vim-lsp-cxx-highlight')
  autocmd FileType c LSP 'c/cpp'
  autocmd FileType cpp LSP 'c/cpp'
endif

"docker lsp config
if dein#tap('Dockerfile.vim')
  autocmd FileType Dockerfile LSP 'dockerfile'
endif

"lua lsp config
"https://github.com/Alloyed/lua-lsp
if dein#tap('vim-lua')
    call coc#config('languageserver', {
      \ 'lua': {
        \ "command": "lua-lsp",
        \ "filetypes": ["lua"],
        \ }
        \})
endif

"shell lsp config
if dein#tap('vim-sh')
  call coc#config('languageserver', {
      \ "bash": {
        \ "command": "bash-language-server",
        \ "args": ["start"],
        \ "filetypes": ["sh"],
        \ "ignoredRootPaths": ["~"],
        \ }
        \})
endif

"R lsp config
if dein#tap('Nvim-R')
    call coc#add_extension('coc-r-lsp')
endif
