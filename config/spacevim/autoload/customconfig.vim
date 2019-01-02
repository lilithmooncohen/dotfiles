func! customconfig#before() abort
  "let some_config_option = 1
endf

func! customconfig#after() abort
  hi Comment    gui=NONE
endf
