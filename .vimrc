" 1.   :h filename-modifiers
" 2.   http://vim.wikia.com/wiki/Best_Vim_Tips
" 3.   READ :h mark-motions   Ex.  '^     ...moves cursor to the last time insert mode was stopped!
" 4.   Type :h Q_op or :h option-list to see all the options for 'set'

" <lamdk> hmm can NERDTree open or expand to your current working
"        directory?  [20:20]
" <saturn_knight> lamdk, I put this in my vimrc for NERDTree:  map
"                 <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" <lamdk> can you do like a :pwd,   but instead print the directory of
"        the file in the current buffer ?  [23:02]
" <frogonwheels> lamdk:  :echo expand('%:p:h')

" <divad`> is there a way to C-]  into a tag into a newtab window
" <divad`> like Ctrl-W C-] but in a tab  [17:32]
" <godlygeek> divad`: <C-w><C-]><C-w>T  would do it.

set nocompatible

syntax on
color desert

filetype plugin on
filetype indent on

" :h macvim  
if has("gui_macvim")
    set macmeta
endif

" only in 7.3!
if has("persistent_undo")
  set undofile
endif

" sets a big red vertical line after the buffers textwidth!
if exists("&colorcolumn")
  "set colorcolumn=+1
  " highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
endif

set autoread

" always show statusbar   ...but also makes :intro screen go away on startup!
set laststatus=2

" Put 4 spaces for a tab...
set tabstop=4
set shiftwidth=4
set expandtab

" more essential set stuff...
set number
set ruler
set autoindent                    " always set autoindenting on!
set hlsearch
set incsearch
set ignorecase                    
set smartcase  
set backspace=indent,eol,start    " from vimrc_example.vim
set showcmd		                  " from vimrc_example.vim
set hidden         " Leave buffer without saving it
set nostartofline  " Avoid moving the cursor when moving around  9/2/2010
set scrolloff=2 
set wildmenu       " cool ex-mode completion thing
set splitright
set splitbelow


" default statusline is... %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"

if has("Tlist_Get_Tagname_By_Line")
    set statusline=%<%f\ [%{Tlist_Get_Tagname_By_Line()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
endif

" Set filename in tab always... need this in MacVim:   http://markmail.org/thread/4hryqbqc26kzzo7s
set guitablabel="%t%m"   " :h statusline

" http://vim.wikia.com/wiki/Hide_toolbar/scrollbar_and_toggle_menu
set guioptions-=T   " No more toolbar 
set guioptions-=r   " No more right scrollbar
set guioptions-=l   " No more left scrollbar
set guioptions-=L  
set guioptions-=b   " No more bottom scrollbar
set guioptions-=e   " default to text tab bar

"  Automatically insert comment thing in comment block: 
"     :h fo-table  &  :h format-comments and just above :h auto-format
set formatoptions=croq

" How to build cscope database: 
"
"       !find . -name '*.java' > cscope.files
"       :cscope -b
"
" http://cscope.sourceforge.net/cscope_vim_tutorial.html
" http://vim.wikia.com/wiki/Cscope
"
" :h cscope-options
" :h cscopequickfix
" :h cscope-suggestions
"
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set cscopetag
    set csto=0

    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " Or you may use the following scheme, inspired by Vim/Cscope tutorial from
    " Cscope Home Page (http://cscope.sourceforge.net/): >

	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif


" Don't switch to the tab if the file is open already when using BufExplorer
 let g:bufExplorerFindActive=0   
" When you hit \bv to open a BufExplorer window in a veritcal split, put the
" new BufExplorer to the right instead of the left
let g:bufExplorerSplitRight=1
let g:bufExplorerSplitBelow=1 

" seem to always hold down shift for 0.1s too long when entering Ex via :
cabbrev Bd bd
cabbrev Bd! bd!
cabbrev Cd cd
cabbrev B b 
cabbrev E e 
cabbrev Q q 
cabbrev Echo echo
cabbrev Edit edit
cabbrev Reg reg
cabbrev Set set
cabbrev So so
cabbrev Tabe tabe
cabbrev Tabmove tabmove
cabbrev Ts ts
cabbrev W w
cabbrev Wa wa
cabbrev Wq wq
cabbrev Wq! wq!
cabbrev TExplore Texplore
cabbrev Vimgrep vimgrep
cabbrev H h

" Turn off expandtab when edting makefiles... from http://vim.wikia.com/wiki/Converting_tabs_to_spaces
autocmd FileType make setlocal noexpandtab

au BufEnter *.java setlocal cindent
" au BufEnter *.java map ]] ]m
" au BufEnter *.java map ][ ]M
" au BufEnter *.java map [[ [m
" au BufEnter *.java map [] [M
" au BufLeave *.java unmap ]]
" au BufLeave *.java unmap ][
" au BufLeave *.java unmap [[
" au BufLeave *.java unmap []

autocmd FileType sh runtime macros/shellmenu.vim

" From  *30.6*    Formatting comments
" au FileType xquery set comments=s1:(:mb::,ex:)

" If running GVim on X11...
if has("gui_running") && has("unix")
     "set guifont=Andale\ Mono\ 9
     "set guifont=Liberation\ Mono\ 9
endif

"switch tabs in insert mode like macosx in GVIM   
"  <M-S-]> = ý 
"  <M-S-[> = û
imap ý <C-o>:tabnext<CR>
imap û <C-o>:tabprevious<CR>
map ý :tabnext<CR>
map û :tabprevious<CR>

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
map \] :lcd %:p:h<CR>

" key bindings david cant live without stuff...
map Q gq
map gb gT
vmap zy "+ygv"*y
nmap zp "+p

" :h scroll-smooth
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

nmap <space> <C-f>
nmap <S-space> <C-b>

" also see :h scroll-insert
imap <C-e> <C-o><C-e>
imap <C-y> <C-o><C-y>


"save easier
map <F2> :w<CR>
map \<F2> :wa<CR>
imap <F2> <C-o>:w<CR>

map gr :so ~/.vim/indent/xquery.vim<CR>:echo "Reloaded xquery indent plugin!"<CR>


"closing windows on accident  - wtf why cant i unmap these
"  ohh... its cuz they're builtins and not mappings
"  http://vim.wikia.com/wiki/Disable_F1_built-in_help_key
map <C-w>q :echo<CR>
map <C-w><C-q> :echo<CR>
map <C-w>c :echo<CR>
map <C-w><C-c> :echo<CR>
nmap <C-w>o :echo<CR>
nmap <C-w><C-o> :echo<CR>
map <F1> <Esc>
imap <F1> <Esc>
map K :echo<CR>

" scroll other window 

nmap <C-M-f> <C-w>w<C-f><C-w>W
nmap <C-M-b> <C-w>w<C-b><C-w>W
nmap <C-M-e> <C-w>w<C-e><C-w>W
nmap <C-M-y> <C-w>w<C-y><C-w>W
imap <C-M-f> <ESC><C-w>w<C-f><C-w>Wa
imap <C-M-b> <ESC><C-w>w<C-b><C-w>Wa
imap <C-M-e> <ESC><C-w>w<C-e><C-w>Wa
imap <C-M-y> <ESC><C-w>w<C-y><C-w>Wa

"imap <C-M-e> <ESC> :Explore %:h <CR>
"nmap <C-M-e> :Explore %:h <CR>

imap <C-M-t> <ESC> :Texplore %:h<CR>
nmap <C-M-t> :Texplore %:h <CR>
nmap <silent> \e :Explore<CR>
nmap <silent> \t :Texplore<CR>
nmap <silent> \v :Vexplore<CR>
nmap <silent> \h :Hexplore<CR>
nmap <silent> \ge :Explore %:h<CR>
nmap <silent> \gt :Texplore %:h<CR>
nmap <silent> \gv :Vexplore %:h<CR>
nmap <silent> \gh :Hexplore %:h<CR>

" move windows with Alt-arrowkey
map <M-Left> <C-w><Left>
map <M-Right> <C-w><Right>
map <M-Up> <C-w><Up>
map <M-Down> <C-w><Down>
imap <M-Left> <C-o><C-w><Left>
imap <M-Right> <C-o><C-w><Right>
imap <M-Up> <C-o><C-w><Up>
imap <M-Down> <C-o><C-w><Down>

" taglist stuff
" Copied from http://files.brad-smith.co.uk/dotfiles/vimrc.txt
map <F3> :TlistToggle<CR>
map <F4> :TlistUpdate<CR>:TlistHighlightTag<CR>
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 23
let Tlist_Inc_Winwidth = 0
"let Tlist_Use_SingleClick = 1
let Tlist_Exit_OnlyWindow = 1


" :h matchit-extend     or... 
"
" http://vim-taglist.sourceforge.net/extend.html
"
"    Also, try 'ctags --list-kinds=all'   to see all the params for different
"    languages that you can pass in to this variable!
"
" let tlist_xquery_settings = 'xquery;v:variable;f:function'

" toggle buffer with f11 instead of Ctrl-6
map <F11> <c-6>
imap <F11> <C-o><F11> 

" Switch buffers like emacs etc. etc.
noremap <C-S-left>  :bprev <CR>
noremap <C-S-right> :bnext <CR>


" 4/26/09  comment-region in Vim... 
"          from http://vim.wikia.com/wiki/Comment/UnComment_visually_selected_text
" ,c comments out a region
" ,u uncomments a region

let b:comment_leader = '// '   "                            i.e. let the default be a //
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java,javascript let b:comment_leader = '// '
au FileType sh,make,python let b:comment_leader = '# '
au FileType velocity let b:comment_leader = '## '
au FileType tex let b:comment_leader = '% '

noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

" http://www.vim.org/scripts/script.php?script_id=541
au! BufRead,BufNewFile *.vm  setfiletype velocity 


" From...     http://ctags.sourceforge.net/faq.html#15
" nmap ,t :!(cd %:p:h;ctags *.[ch])&
:nmap ,t :!(cd %:p:h;ctags *.java)&


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""  START OF VIM FUNCTIONS!"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"
"  from vimrc_example.vim
"
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


"  <lamdk> hm anyone know in vimscript how to check if the character
"          before the cursor is a space?
"
"  <jamessan> lamdk, getline('.')[col('.')-2] should give you the
"             character before the cursor. may break with 
"             multi-byte characters
"
" <godlygeek> lamdk: :echo matchstr(getline('.'), '\%' . (col('.')-1)
"             . 'c.') == ' '   checks if character before the cursor is
"                         a space, and works with multibyte chars
"
"  On pg 84 of 'Hacking Vim'      5/18/09
"
function! SuperCleverTab()
    "check if at beginning of line or after a space
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'  
        return "\<Tab>"
    elseif getline('.')[col('.')-2] =~ '\s'  
        " PATCH: cuz above don't check if point is after a space...
        return "\<Tab>"
    else
        " do we have omni completion availaaable
        if &omnifunc != ''
            "use omni-completion 1. priority
            "return "\<C-X>\<C-O>"
            return "\<C-N>"
        elseif $dictionary != ''
            "no omni-completion, try dictionary completion
            return "\<C-K>"
        else
            "use omni completion or dictionary completion
            "use known-word completion
            return "\<C-N>"
        endif
    endif
endfunction


" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
if !exists(":QFix")
    command -bang -nargs=? QFix call QFixToggle(<bang>0)

    function! QFixToggle(forced)
       if exists("g:qfix_win") && a:forced == 0
          cclose
          unlet g:qfix_win
       else
          " copen 10
          copen 6
          let g:qfix_win = bufnr("$")
       endif
    endfunction
end

function! EasyVimGrep(...)
  let path    = (a:0 == 1) ? a:1 : ''    " :h function-argument
  let curline = getline('.')
  call inputsave()
  let q = input('vimgrep dis: ')
  call inputrestore()

  " http://markmail.org/message/u3kb7qu62ifvopht
   if(empty(q)) | return | endif 

  ":vimgrep /q/ **/*
  :execute "vimgrep /" . q . "/ **/*" . path
  ":execute "echo \"VimGrepped for... " . q . "\""
endfunction


function! ToggleCursorColumn() 
    if &cursorcolumn == 0
        set cursorcolumn
    else
        set nocursorcolumn
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""END OF VIM FUNCTIONS!"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping the functions above... 

inoremap <Tab> <C-R>=SuperCleverTab()<CR>
nmap <silent> \` :QFix<CR>

map <M-v> :call EasyVimGrep()<CR> 
map <F6> :call EasyVimGrep() <CR>
map <M-S-v> :call EasyVimGrep('.xqy')<CR> 

map <F7> :call ToggleCursorColumn()<CR>


"  NERDTree function mappin stuff
"
map <F5> :execute '  NERDTreeToggle' . expand('%:p:h') <CR>
"map <F6> :NERDTreeToggle <CR>
imap <F5> <C-o>:execute '  NERDTreeToggle' . expand('%:p:h') <CR>
"imap <F6> <C-o><F6>




""""""""""""""""""""""""" START EMACS KEYS """"""""""""""""""""""""""

" 5/27/09
" Disable meta/alt from selecting menubars and Emacs keys 
"
"  NOTE:  How to see what a keyboard combination sends to Vim?
"           1. Go into Ex :
"           2. push ^V
"           3. Type the key combo, and it'll show at the bottm 
"           
"   also see :help map-special-keys
        
" Dont let alt select menu bar stuff
set winaltkeys=no 

map <M-a> <home>
map <M-e> <end>
imap <M-a> <home>
imap <M-e> <end>

imap <M-n> <down>
imap <M-p> <up>
imap <C-f> <right>
imap <C-b> <left>
imap <M-f> <ESC>ea
imap <M-b> <ESC>bi
imap <M-m> <C-o>^
imap <M-d> <c-o>x
imap <M-D> <ESC>ldei
"imap <M-BS> <ESC>dBxi
imap <M-BS> <C-w>
imap <M-k> <ESC>lDa
imap <M-t> <ESC>Xpa
imap <C-_> <ESC>ui
"imap <M-[> <ESC><C-r>i
imap <C-l> <C-o>zz
imap <M-o> <C-o>O
imap <M-v> <C-o><C-f>
imap <M-V> <C-o><C-b>

"nmap <M-f> w
nmap <M-f> el
nmap <M-b> b
vmap <M-f> el
vmap <M-b> b

nmap <M-m> ^
nmap <M-d> ce
nmap <M-BS> dB
nmap <M-k> Da
nmap <M-t> Xp
nmap <C-_> u
nmap <M-o> O
"nmap <M-[> <C-r>

" Emacs like tab 
nmap <S-Tab> ==
imap <S-Tab> <C-o>==

imap <M-\> <C-o>S
nmap <M-\> S

"""""""""""""""""""""""""" END EMACS KEYS """""""""""""""""""""""""""


" 8/25/2010
" <lamdk> is there a thingy that turns camelCase into non_camel_case o_O
" <graywh> ciw<C-r>=substitute(@", '\l\zs\(\u\)', '_\l\1', 'g')<CR><Esc>bgul
"
"  http://github.com/graywh/dotfiles/blob/master/.vimrc

"  camelCase -> non_camel_case
nnoremap <Leader>c ciw<C-r>=substitute(@", '\l\zs\(\u\)', '_\l\1', 'g')<CR><Esc>bgul

"  non_camel_case -> camelCase
nnoremap <Leader>C ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl



"  http://vim.wikia.com/wiki/VimTip349   'Format your xml document using xmllint'  (in package libxml2)
"  
"         11/10/2010
"         <lamdk> hmm i have a XML file where all its elements are on one line,
"                 is there an editor plugin or something that will format it
"                 nice?
"         <_rane> good question  
"         <jamessan> :s/>/&\r/g | normal! gg=G 
"         <lamdk> lol whoa pretty cool
"
" one or more lines:
vmap ,px !xmllint --format -<CR>
" pretty-print current line
nmap ,px !!xmllint --format -<CR>

" :h zip-extension   
au BufReadCmd *.jar,*.xpi,*.xlsx,*.docx call zip#Browse(expand("<amatch>"))

" :h synID()  echoes the name of the syntax item under the cursor
map <Leader>s :echo synIDattr(synID(line('.'), col('.'), 0), "name")<CR>

" XXX  for debugging only!
noremap ,i :so ~/.vim/indent/xquery.vim<CR>

" Don't underline <a>links</a> when editing html files
let html_no_rendering=1
