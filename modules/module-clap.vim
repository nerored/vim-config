let s:user_init_vim = expand($VIM_PATH.'/local/init.vim')
let s:user_plugins = expand($VIM_PATH.'/local/plugins.yaml')
let s:user_zshrc = expand($HOME . '/.zshrc')
let s:user_tmux_conf = expand($HOME . '/.tmux.conf')

let g:clap_cache_directory = $DATA_PATH . '/clap'
"let g:clap_theme = 'material_design_dark'
let g:clap_selected_sign= { 'text': '✓', 'texthl': "ClapSelectedSign", "linehl": "ClapSelected"}
let g:clap_current_selection_sign= { 'text': '➜', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_search_box_border_style = 'nil'
let g:clap_provider_grep_enable_icon = 1
let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '

let g:clap_provider_personalconf = {
      \ 'source': [s:user_init_vim,s:user_plugins,s:user_zshrc,s:user_tmux_conf],
      \ 'sink': 'e',
      \ }

" A funtion to config highlight of ClapSymbol
" when the background color is opactiy
function! s:ClapSymbolHL() abort
    let s:current_bgcolor = synIDattr(hlID("Normal"), "bg")
    if s:current_bgcolor == ''
        hi ClapSymbol guibg=NONE ctermbg=NONE
    endif
endfunction

autocmd User ClapOnEnter call s:ClapSymbolHL()

let g:clap_theme = {
    \ 'input':
    \   {
    \     'guifg'  :'white',
    \     'ctermfg':'white',
    \     'guibg'  :'#0086af',
    \     'ctermbg':021
    \   },
    \ 'spinner':
    \   {
    \     'guifg'  :'white',
    \     'ctermfg':'white',
    \     'guibg'  :'#0086af',
    \     'ctermbg':021
    \   },
    \ 'display':
    \   {
    \     'guibg'  :'#eeeeee',
    \     'ctermbg':'255',
    \   },
    \ 'selected_sign':
    \   {
    \     'guifg'  :'#009aa5',
    \     'ctermfg':039,
    \   },
    \ 'current_selection_sign':
    \   {
    \     'guifg'  :'#009aa5',
    \     'ctermfg':039,
    \   },
    \ 'selected':
    \   {
    \     'guifg'  :'#585858',
    \     'ctermfg':240,
    \   },
    \ 'current_selection':
    \   {
    \     'guifg'  :'white',
    \     'ctermfg':'white',
    \     'guibg'  :'#009aa5',
    \     'ctermbg':021
    \   },
    \ 'preview':
    \   {
    \     'guibg'  :'#d6d6d6',
    \     'ctermbg':253
    \   },
    \ }
