"NeoBundle Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

set shortmess=a
set cmdheight=2

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic' " Syntax checking hacks for vim
NeoBundle 'FrigoEU/psc-ide-vim' " Vim plugin for psc-ide
NeoBundle 'vim-scripts/Smart-Tabs' " Use tabs for indent, spaces for alignment
NeoBundleLazy 'raichoo/purescript-vim', {'autoload': {'filetypes': 'psc'}}
NeoBundle 'Shougo/vimproc.vim' " Interactive command execution in Vim.
NeoBundle 'ap/vim-buftabline' " Forget Vim tabs – now you can have buffer tabs
NeoBundle 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
NeoBundleLazy 'WolfgangMehner/perl-support', {
            \ 'autoload': {
            \ 'filetypes': 'pl'
            \ }
            \ } " Edit Perl scripts in Vim/gVim. Insert code snippets, run, check, and profile the code and look up help.
NeoBundle 'dpc/vim-smarttabs' " Vim Smart Tabs
NeoBundle 'scrooloose/nerdtree' " A tree explorer plugin for vim.
NeoBundle 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
NeoBundle 'edkolev/erlang-motions.vim' " Motions and text objects for erlang!

"NeoBundleLazy 'jimenezrick/vimerl', {'autoload': {'filetypes': 'erl'}}
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'vim-erlang/vim-erlang-compiler'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
NeoBundle 'vim-erlang/vim-erlang-tags'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
" echom "Neobundle loaded"

let g:syntastic_enable_perl_checker = 1
set number

" erlang
let g:erlang_highlight_special_atoms = 1
let erlang_force_use_vimerl_indent = 1

" color theme
colorscheme wombat256

" windows navigation
map <D-Up> <Up>
map <D-Down> <Down>
map <D-Right> <Right>
map <D-Left> <Left>

" buffer navigation
map <C-PageUp> :bprev<cr>
map <C-PageDown> :bnext<cr>
" echom "Navigation hotkeys added"

" tab autocompletion
set wildmode=longest,list,full
set wildmenu

" automatically chdir to current files directory
set autochdir

" search settings
set incsearch  " incremental
set hlsearch   " highlight search

" folding
let perl_fold=1  " it makes loading large files rather slow
set foldlevel=1

" whitespace
set listchars=tab:\|\
set list

" tab
set noexpandtab
set tabstop=4
set shiftwidth=4

" trim trailing empty lines on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let g:AutoPairsUseInsertedCount = 1

" echom "Misc settings set"

" purescript
au FileType purescript nmap <leader>t :PSCIDEtype<CR>
au FileType purescript nmap <leader>s :PSCIDEapplySuggestion<CR>
au FileType purescript nmap <leader>a :PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <leader>i :PSCIDEimportIdentifier<CR>
au FileType purescript nmap <leader>r :PSCIDEload<CR>
au FileType purescript nmap <leader>p :PSCIDEpursuit<CR>
au FileType purescript nmap <leader>c :PSCIDEcaseSplit<CR>
au FileType purescript nmap <leader>qd :PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <leader>qa :PSCIDEaddImportQualifications<CR>


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_perl_checkers = "perl"
" echom "Syntastic set up"
