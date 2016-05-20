if has("gui_macvim")
    macmenu File.New\ Window key=<nop>
    macmenu File.New\ Tab key=<nop>
    macmenu File.Open\.\.\. key=<nop>
    macmenu File.Save key=<nop>
    macmenu File.Save\ As\.\.\. key=<nop>
    macmenu File.Print key=<nop>

    macmenu Edit.Undo key=<nop>
    macmenu Edit.Redo key=<nop>
    macmenu Edit.Cut key=<nop>
    macmenu Edit.Select\ All key=<nop>
    macmenu Edit.Find.Find\.\.\. key=<nop>
    macmenu Edit.Find.Find\ Next key=<nop>
    macmenu Edit.Find.Find\ Previous key=<nop>
    macmenu Edit.Find.Use\ Selection\ for\ Find key=<nop>

    macmenu Tools.Spelling.To\ Next\ error key=<nop>
    macmenu Tools.Spelling.Suggest\ Corrections key=<nop>
    macmenu Tools.List\ Errors key=<nop>

    macmenu Window.Minimize key=<C-D-m>

    map  <D-r> :w<CR><Plug>(quickrun)
    imap <D-r> <ESC>:w<CR><Plug>(quickrun)

    map <D-/> <plug>NERDCommenterToggle

    noremap <D-g> :<C-u>UniteWithCursorWord -immediately tag<CR>
    noremap <D-o> :<C-u>UniteWithProjectDir -buffer-name=files -input= -start-insert file<CR>
    noremap <D-O> :<C-u>UniteWithBufferDir -buffer-name=project-files -input= -start-insert file_rec/async<CR>
endif


