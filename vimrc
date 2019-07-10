" vim config for jove

"============ Plugin ==================
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')

    " vim 8 dep
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('altercation/vim-colors-solarized')
    " call dein#add('icymind/NeoSolarized')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    " call dein#add('Shougo/denite.nvim')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('Yggdroot/LeaderF')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('mbbill/undotree')
    call dein#add('nathanaelkane/vim-indent-guides')
    " call dein#add('Yggdroot/indentLine')
    call dein#add('mhinz/vim-signify')
    call dein#add('tpope/vim-abolish.git')
    call dein#add('rhysd/conflict-marker.vim')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('scrooloose/syntastic')
    call dein#add('tpope/vim-fugitive')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-commentary')
    call dein#add('godlygeek/tabular')
    call dein#add('majutsushi/tagbar')

    " COMPLETE
    call dein#add('Shougo/deoplete.nvim')
    " call dein#add('ujihisa/neco-look')
    call dein#add('deoplete-plugins/deoplete-jedi')
    call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})
    call dein#add('deoplete-plugins/deoplete-clang')
    call dein#add('deoplete-plugins/deoplete-docker')
    call dein#add('carlitux/deoplete-ternjs')
    call dein#add('sebastianmarkow/deoplete-rust')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/neosnippet')
    "call dein#add('Shougo/neosnippet-snippets')
    "call dein#add('Valloric/YouCompleteMe')
    "call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
    call dein#add('tbodt/deoplete-tabnine', {'build':'sh install.sh'})
    " call dein#add('autozimu/LanguageClient-neovim')

    " PYTHON
    call dein#add('davidhalter/jedi-vim')

    " LUA
    call dein#add('xolox/vim-lua-ftplugin')
    call dein#add('xolox/vim-misc')

    " HTML
    call dein#add('mattn/emmet-vim')

    " CSS
    call dein#add('othree/csscomplete.vim')

    " GO
    call dein#add('fatih/vim-go')

    " MARKDOWN
    call dein#add('JamshedVesuna/vim-markdown-preview')

    " SYNTAX
    call dein#add('sheerun/vim-polyglot') " many lang syntax
    call dein#add('vim-scripts/scons.vim')

    " OS
    if has('mac')
        call dein#add('rizzatti/dash.vim')
    endif

    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on    " required
syntax enable

"============ GENERAL ==============
set t_Co=256
set background=dark         " Assume a dark background
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set encoding=utf-8
scriptencoding utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

"============= UI ==============
if dein#tap('vim-colors-solarized')
    colorscheme solarized             " Load a colorscheme
endif
if dein#tap('NeoSolarized')
    colorscheme NeoSolarized
    set termguicolors
endif

set guifont=Monaco:h14
set tabpagemax=15               " Only show 15 tabs
set noshowmode                    " Display the current mode

set cursorline                  " Highlight current line
" if has('cmdline_info')
"     set ruler                   " Show the ruler
"     set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"     set showcmd                 " Show partial commands in status line and
" endif
" if has('statusline')
"     set laststatus=2
"
"     " Broken down into easily includeable segments
"     set statusline=%<%f\                     " Filename
"     set statusline+=%w%h%m%r                 " Options
"     set statusline+=%{fugitive#statusline()} " Git Hotness
"     set statusline+=\ [%{&ff}/%Y]            " Filetype
"     set statusline+=\ [%{getcwd()}]          " Current dir
"     set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nofoldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"set completeopt=menu,preview,longest
set completeopt=menu,longest
"set pumheight=10
set previewheight=5


"============== FORMAT ==============

set wrap                        " wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
autocmd FileType c,cpp,java,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql,vim autocmd BufWritePre <buffer> call StripTrailingWhitespace()
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType vue,javascript,scss,css,html,haskell,puppet,ruby,yml,lua setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vue syntax sync fromstart
autocmd FileType crontab setlocal nobackup nowritebackup
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.pug.javascript.css
autocmd BufRead,BufNewFile SCons* setlocal filetype=scons

" ============ KEY MAP ==============
let mapleader = ','

" easy move windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Clear search result
nmap <silent> <leader>/ :nohlsearch<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" Easier formatting
nnoremap <silent> <leader>q gwip

" json
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
" let g:vim_json_syntax_conceal = 0

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
" To disable this, add the following to your .vimrc.before.local file:
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

augroup TerminalStuff
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END


"========== PLUGIN ============

if dein#tap('vim-lua-ftplugin')
    let g:lua_check_syntax = 0
    let g:lua_complete_omni = 1
    let g:lua_complete_dynamic = 0
    let g:lua_define_completion_mappings = 0
    " let g:lua_interpreter_path = '/usr/local/opt/openresty/bin/resty'
endif

if dein#tap('nerdcommenter')
    let g:NERDSpaceDelims = 1
    let g:NERDRemoveExtraSpaces = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
    let g:NERD_c_alt_style = 1
    let g:NERDCustomDelimiters = {'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }}
endif


" denite
if dein#tap('denite.nvim')
" denite option
    let s:denite_options = {
          \ 'default' : {
          \ 'winheight' : 15,
          \ 'mode' : 'insert',
          \ 'quit' : 1,
          \ 'highlight_matched_char' : 'MoreMsg',
          \ 'highlight_matched_range' : 'MoreMsg',
          \ 'direction': 'rightbelow',
          \ 'statusline' : has('patch-7.4.1154') ? v:false : 0,
          \ 'prompt' : '➭',
          \ }}

    function! s:profile(opts) abort
        for fname in keys(a:opts)
            for dopt in keys(a:opts[fname])
                call denite#custom#option(fname, dopt, a:opts[fname][dopt])
            endfor
        endfor
    endfunction
    call s:profile(s:denite_options)

    call denite#custom#var(
      \ 'buffer',
      \ 'date_format', '%m-%d-%Y %H:%M:%S')

    " KEY MAPPINGS
    let s:insert_mode_mappings = [
      \ ['jk', '<denite:enter_mode:normal>', 'noremap'],
      \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
      \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
      \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
      \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
      \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
      \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
      \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
      \ ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
      \ ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
      \ ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
      \ ['<Up>', '<denite:assign_previous_text>', 'noremap'],
      \ ['<Down>', '<denite:assign_next_text>', 'noremap'],
      \ ['<C-Y>', '<denite:redraw>', 'noremap'],
      \ ]

    let s:normal_mode_mappings = [
      \ ["'", '<denite:toggle_select_down>', 'noremap'],
      \ ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
      \ ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
      \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
      \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
      \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
      \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
      \ ['gg', '<denite:move_to_first_line>', 'noremap'],
      \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
      \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
      \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
      \ ['q', '<denite:quit>', 'noremap'],
      \ ['r', '<denite:redraw>', 'noremap'],
      \ ]

    for s:m in s:insert_mode_mappings
        call denite#custom#map('insert', s:m[0], s:m[1], s:m[2])
    endfor
    for s:m in s:normal_mode_mappings
        call denite#custom#map('normal', s:m[0], s:m[1], s:m[2])
    endfor

    unlet s:m s:insert_mode_mappings s:normal_mode_mappings
endif

" Language server
if dein#tap('LanguageClient-neovim')
    " Required for operations modifying multiple buffers like rename.
    set hidden

    " ref: https://spacevim.org/layers/language-server-protocol/
    " pip install python-language-server
    " npm install vue-language-server -g
    " npm install bash-language-server -g
    " npm install typescript-language-server -g
    " npm install vscode-html-languageserver-bin -g
    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls'],
        \ 'go': ['go-langserver'],
        \ 'vue': ['vls'],
        \ 'sh': ['bash-language-server', 'start'],
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'typescript': ['typescript-language-server', '--stdio'],
        \ 'html': ['html-languageserver', '--stdio'],
        \ 'c': ['clangd'],
        \ 'cpp': ['clangd'],
        \ 'objc': ['clangd'],
        \ 'objcpp': ['clangd'],
        \ 'lua': ['lua-lsp'],
        \ }
    " Or map each action separately
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <leader>g :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>

endif

" echodoc
if dein#tap('echodoc.vim')
    let g:echodoc#enable_at_startup=1
endif

" syntastic
if dein#tap('syntastic')
    let g:syntastic_python_checkers = ['pyflakes']
    let g:syntastic_go_checkers = ['govet', 'gofmt', 'errcheck']
endif

" deoplete
if dein#tap('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1

    " SuperTab like snippets' behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <expr><TAB>
     \ pumvisible() ? "\<C-n>" :
     \ neosnippet#expandable_or_jumpable() ?
     \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.lua = '\w+|[^. *\t][.:]\w*'

    call deoplete#custom#source('tabnine', 'rank', 150)
endif

" vim-go
if dein#tap('vim-go')
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    au FileType go nmap <Leader>s <Plug>(go-implements)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>rn <Plug>(go-rename)
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <Leader>d <Plug>(go-doc)
endif

" ctag
if executable('ctags')
    set tags=./tags;/,~/.vimtags
    " Make tags placed in .git/tags file available in all levels of a repository
    let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
    if gitroot != ''
        let &tags = &tags . ',' . gitroot . '/.git/tags'
    endif
endif

" nerdtree
if dein#tap('nerdtree')
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif


" tabular
if dein#tap('tabular')
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

" ctrl p
if dein#tap('ctrlp.vim')
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
    \ }

endif

" tagbar
if dein#tap('tagbar')
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
endif

if dein#tap('vim-fugitive')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif


" snippet
if dein#tap('neosnippet')

    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)

    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/honza/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Disable default snippets
    let g:neosnippet#disable_runtime_snippets = {'_':1}

    " Enable neosnippets when using go
    let g:go_snippet_engine = "neosnippet"

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

    " For conceal markers.
    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif
endif

" undotree
if dein#tap('undotree')
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
endif

" indent
if dein#tap('vim-indent-guides')
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_tab_guides = 0
endif

" airline
if dein#tap('vim-airline-themes')
    let g:airline_theme = 'solarized'
    let g:airline_powerline_fonts=1
    let g:airline_highlighting_cache = 1
    " let g:airline_statusline_ontop=1
    " let g:airline#extensions#tabline#enabled = 1
endif

" jedi
if dein#tap('jedi-vim')
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#force_py_version = 3
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#use_tabs_not_buffers = 1
endif

" youcompleteme
if dein#tap('YouCompleteMe')
    let g:acp_enableAtStartup = 0

    let g:ycm_python_binary_path = 'python'

    " enable completion from tags
    let g:ycm_collect_identifiers_from_tags_files = 1

    " remap Ultisnips for compatibility for YCM
    let g:UltiSnipsExpandTrigger = '<C-k>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview

    nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif
if dein#tap('vim-polyglot')
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0
endif

if dein#tap('vim-markdown-preview')
    let vim_markdown_preview_toggle=0
    let vim_markdown_preview_github=1
    let vim_markdown_preview_hotkey='<leader>md'
    let vim_markdown_preview_browser='Google Chrome'
endif

"============ FUNCTION =============
function! StripTrailingWhitespace()
" preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Shell command
function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction
command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/.' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

au BufEnter ?* call PreviewHeightWorkAround()
function! PreviewHeightWorkAround()
  if &previewwindow
    exec 'setlocal winheight='.&previewheight
  endif
endfunc
