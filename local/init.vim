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
""                              ctrlsf setting
""""
map <Leader>t :Defx <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              buffer setting
""""
map <Leader>b :Bonly!<CR>
map <Leader>c :bp \| bd #<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              licens setting
""""
let g:header_auto_add_header = 0
let g:header_field_timestamp_format = '%Y-%m-%d'
let g:header_go_comment_char = '//'
let g:header_field_author = 'nerored'
let g:header_field_author_email = 'nero_stellar@icloud.com'
nnoremap <Leader>h :AddMITLicens<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              vim-go setting
""""
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"disable use K to run godoc
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0

let g:go_fmt_fail_silently = 1
let g:go_rename_command = 'gopls'

map <Leader>r :GoReferrers<CR>

au FileType go nmap <Leader>ff <Plug>(go-def)

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
