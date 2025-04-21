" Setting 'SumatraPDF' as PDF viewer (ensure that "SumatraPDF" is a executable callable from the command line)
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

" Setting Quickfix list to automatically close after one keystroke
let g:vimtex_quickfix_autoclose_after_keystrokes = 1

" Counts the number of words
noremap <localleader>lw <Cmd>VimtexCountWords<CR>

" Use `[ds/cs/ts]m` to delete/change/toggle surrounding math (replacing the default shorcut `[ds/cs/ts]$`)
nmap dsm <Plug>(vimtex-env-delete-math)
nmap csm <Plug>(vimtex-env-change-math)
nmap tsm <Plug>(vimtex-env-toggle-math)

" Use `ai` and `ii` for the item text object
omap ai <Plug>(vimtex-am)
xmap ai <Plug>(vimtex-am)
omap ii <Plug>(vimtex-im)
xmap ii <Plug>(vimtex-im)

" Use `am` and `im` for the inline math text object
omap am <Plug>(vimtex-a$)
xmap am <Plug>(vimtex-a$)
omap im <Plug>(vimtex-i$)
xmap im <Plug>(vimtex-i$)

" Use '[/]''e/E' to move between enviroments (which are '[/]''m/M' in VimTex)
nmap ]e <Plug>(vimtex-]m)
xmap ]e <Plug>(vimtex-]m)
omap ]e <Plug>(vimtex-]m)
nmap ]E <Plug>(vimtex-]M)
xmap ]E <Plug>(vimtex-]M)
omap ]E <Plug>(vimtex-]M)
nmap [e <Plug>(vimtex-[m)
xmap [e <Plug>(vimtex-[m)
omap [e <Plug>(vimtex-[m)
nmap [E <Plug>(vimtex-[M)
xmap [E <Plug>(vimtex-[M)
omap [E <Plug>(vimtex-[M)

" Use '[/]''m/M' to move between math zones (which are '[/]''n/N' in VimTex)
nmap ]m <Plug>(vimtex-]n)
xmap ]m <Plug>(vimtex-]n)
omap ]m <Plug>(vimtex-]n)
nmap ]M <Plug>(vimtex-]N)
xmap ]M <Plug>(vimtex-]N)
omap ]M <Plug>(vimtex-]N)
nmap [m <Plug>(vimtex-[n)
xmap [m <Plug>(vimtex-[n)
omap [m <Plug>(vimtex-[n)
nmap [M <Plug>(vimtex-[N)
xmap [M <Plug>(vimtex-[N)
omap [M <Plug>(vimtex-[N)
