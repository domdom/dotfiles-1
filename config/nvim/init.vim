set nocompatible
filetype off

" Plugins
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	" Style
		Plugin 'chriskempson/base16-vim'
		Plugin 'vim-airline/vim-airline'
		Plugin 'vim-airline/vim-airline-themes'

	" Tools
		Plugin 'majutsushi/tagbar'
		Plugin 'craigemery/vim-autotag'
		Plugin 'scrooloose/nerdtree'
		Plugin 'Raimondi/delimitMate'
		Plugin 'Shougo/deoplete.nvim'
		Plugin 'zchee/deoplete-clang'
		Plugin 'w0rp/ale'
		Plugin 'junegunn/goyo.vim'

	" Rust
		Plugin 'rust-lang/rust.vim'
		Plugin 'racer-rust/vim-racer'

	" Syntax Highlighting
		Plugin 'octol/vim-cpp-enhanced-highlight'
		Plugin 'justinmk/vim-syntax-extra'

	call vundle#end()

" Settings
	source ~/.config/nvim/common_settings.vim
	source ~/.config/nvim/plugin_configs.vim
	source ~/.config/nvim/mappings.vim
	source ~/.config/nvim/functions.vim
	source ~/.config/nvim/snippets.vim

