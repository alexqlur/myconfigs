set nocompatible              " be iMproved, required
" filetype off                  " required

" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on
set path+=**
set wildmenu
" set foldmethod=indent


fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" ACTIVATING PLUGINS

" OPTION 1, use VAMActivate
"VAMActivate PLUGIN_NAME PLUGIN_NAME ..

" OPTION 2: use call vam#ActivateAddons
"call vam#ActivateAddons([PLUGIN_NAME], {})
" use <c-x><c-p> to complete plugin names

" OPTION 3: Create a file ~/.vim-scripts putting a PLUGIN_NAME into each line (# for comments)
" See lazy loading plugins section in README.md for details
"call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})




" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"Plugin 'zxqfl/tabnine-vim'
" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'


"Plugin 'mxw/vim-jsx'
"Plugin 'pangloss/vim-javascript'
"Plugin 'honza/vim-snippets'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax enable
set background=dark

autocmd FileType js UltiSnipsAddFiletypes javascript
autocmd FileType jsx UltiSnipsAddFiletypes javascript-react
autocmd FileType js UltiSnipsAddFiletypes my 
autocmd FileType js UltiSnipsAddFiletypes javascript-jest 
" autocmd FileType json UltiSnipsAddFiletypes json


ActivateAddons vim-snippets snipmate
