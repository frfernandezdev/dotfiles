"------------------------------------------------------------
" Mappings {{{1

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

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
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Save 
nnoremap <C-S> :w <CR>==
inoremap <C-S> <ESC> :w <CR>==gi
vnoremap <C-S> :w <CR>gv=gv

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" ----------------
