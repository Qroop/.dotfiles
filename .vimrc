"Relative line numbers"
set number relativenumber

"Copy to clipboard"
set clipboard+=unnamed

" Scrolloff distance
set scrolloff=8

"Set leader"
let mapleader = " "

" Use the current millenium
set nocompatible

syntax enable
filetype plugin indent on

"Colorsheme
colorscheme nord
highlight Visual cterm=reverse ctermbg=NONE

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

" Center the screen after common jumps
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap { {zz
nnoremap } }zz
nnoremap [[ [[zz
nnoremap ]] ]]zz
nnoremap % %zz
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Center screen after scrolling half-pages
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center after jumping with marks
nnoremap ` `zz
nnoremap ' 'zz

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

" FILER
"
" Använd :find för att söka efter filer i en mapp
" Använd *.rb för att söka 'fuzzy' efter alla ruby filer
"
" Search down into subfolders
" Provides auto-completion for all file-related tasks
set path+=**

" Display all the matching flies when we tab-complete
set wildmenu

" :b låter dig autocompleta alla öppna buffers, kort för buffer
" Skriv in en substring som är unik till filen, tab-complete annars


" STATUSLINE
" -------------------------------
" Custom Statusline Configuration
" -------------------------------

" Function to return the current mode in a fixed-width format.
function! MyMode()
    let l:mode = mode()
    " Map some common modes to more readable names.
    if l:mode ==# 'n'
        let l:mode = "NORMAL"
    elseif l:mode ==# 'i'
        let l:mode = "INSERT"
    elseif l:mode ==# 'v'
        let l:mode = "VISUAL"
    elseif l:mode ==# 'V'
        let l:mode = "V-LINE"
    elseif l:mode ==# "\<C-v>"
        let l:mode = "BLOCK"
    endif
    " Pad the mode string to a fixed width (here, 8 characters).
    return printf(" %8s ", l:mode)
endfunction
"
" Function to return Git branch and status for the current file.
function! MyGit()
    " Try to get the current Git branch.
    let l:branch = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    if v:shell_error != 0
        return "" " Not in a Git repo.
    endif
    let l:branch = substitute(l:branch, '\n', '', 'g')

    " Get Git status for the current file.
    if expand('%') == ""
        let l:status = ""
    else
        let l:status = system('git status --porcelain ' . shellescape(expand('%:p')) . ' 2>/dev/null')
        if v:shell_error != 0 || l:status == ""
            let l:status = ""
        else
            " Grab the first character from the status indicator (e.g., 'M' for modified).
            let l:status = " " . l:status[0]
        endif
    endif
    " Format the Git info. It will show as: [branch status] on the right.
    return printf(" [%s%s] ", l:branch, l:status)
endfunction

" Assemble the statusline:
" - Left side: mode (padded) then the relative file path (%f).
" - Right side: Git branch and status (if in a repo).
set statusline="%{MyMode()}%f%=%{MyGit()}"

" Make sure the statusline is always visible.
set laststatus=2


" TAGGING
command! MakeTags !ctags -R .
set tags=./tags;,tags;

" Alt/Meta + t for tag completion (works in most terminals/guis)
imap <C-f> <C-x><C-]>

" AUTOCOMPLET
