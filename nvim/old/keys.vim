"------------------------------------------------------------
" Mappings {{{1

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <c-l> :nohl<CR><c-l>

nnoremap <A-d> :t .<CR>==
inoremap <A-d> <Esc>:t .<CR>==gi
vnoremap <A-d> :t$ <CR>gv=gv

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Shifting blocks visually 
nnoremap <Tab> 	 >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move between tabs
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>

" Save 
nnoremap <C-s> :w <CR>
inoremap <C-s> <ESC> :w <CR>
vnoremap <C-s> :w <CR>

" -------------

" NerdTree Mapping
nnoremap <leader>b :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
" ----------------

" FzF Mapping
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>g :Commits<CR>
 
" -----------

" Coc Mapping

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>showdocumentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ----------------

let g:AutoPairsShortcutToggle='' 
