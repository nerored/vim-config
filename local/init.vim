"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              editor setting
""""
let g:mapleader=","
set norelativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set colorcolumn=80

inoremap  <C-h> <Left>
inoremap  <C-j> <Down>
inoremap  <C-k> <Up>
inoremap  <C-l> <Right>
inoremap  <C-d> <DELETE>

map <Leader>q :wqa<CR>

autocmd TermOpen * setlocal nonumber norelativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              scheme setting
""""
colorscheme PaperColor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              lanching setting
""""
function GetCurFilePath()
    let cur_dir = getcwd()
    let cur_file = getreg('%')
    let abs_path = cur_dir."/".cur_file.":".line('.')
    echo abs_path."         done"
    call setreg('+',abs_path)
endfunction

nnoremap <Leader>cc :call GetCurFilePath() <CR>

autocmd VimEnter * Vista!!
autocmd VimEnter * if empty(bufname('')) | Defx | endif
