"Relative line numbers"
set number relativenumber

"Copy to clipboard"
set clipboard=unnamedplus

"Set leader"
let mapleader = " "

"Colorsheme
colorscheme nord
highlight Visual cterm=reverse ctermbg=NONE

" Enable filetype detection, plugins, and indentation rules
filetype plugin indent on

" Use spaces instead of hard tabs (important for consistency)
set expandtab

" Set the number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Set the number of spaces that a Tab character displays as
set tabstop=4

" Automatically copy the indent from the current line when starting a new line
set autoindent

" Enable 'smart' auto-indenting (useful for many programming languages)
set smartindent

" Make backspace delete over indentation, line breaks, and the start of insert mode
set backspace=indent,eol,start

" When editing, treat a tab press as if it were this many spaces.
" This also makes backspace delete a full tab-equivalent instead of a single space.
set softtabstop=4

" Improve tab behavior at the beginning of a line
set smarttab

"---Mappings---"
"================================================
" Map <leader>e to toggle the file explorer in the current window.
nnoremap <leader>e :e .<CR>

" Wrap word under cursor with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Wrap word under cursor with single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" add mapping for auto closing
imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O
