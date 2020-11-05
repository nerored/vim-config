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
set t_Co=256   " This is may or may not needed.

set background=light
colorscheme PaperColor

let g:lightline = { 'colorscheme': 'PaperColor' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              ctrlsf setting
""""
map <Leader>s :CtrlSF<CR>
map <Leader>ss :CtrlSFClose<CR>
map <Leader>rr :CtrlSFOpen<CR>

let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_position = 'bottom'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              defx setting
""""
map <Leader>t :Defx <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              buffer setting
""""
map <Leader>b :Bonly!<CR>
map <Leader>c :bp \| bd #<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

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

autocmd VimEnter * if empty(bufname('')) | Defx | endif
autocmd VimEnter * Vista!!
