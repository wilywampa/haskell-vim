" syntax highlighting for cabal
"
" author: raichoo (raichoo@googlemail.com)

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn match cabalLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$" contains=@Spell
syn match cabalIdentifier "[A-Za-z\-]*" contained
syn match cabalOperator "[<=>&|]"
syn match cabalColon ":" contained
syn match cabalNumber "\<[0-9][0-9\.]*\>"
syn match cabalDelimiter "[,()]"
syn keyword cabalBool True False
syn keyword cabalConditional if else
syn match cabalCompilerFlag "\s\+-[^ -][^ ]*"
syn match cabalBulletPoint "^\s\+\*"
syn match cabalSection "^\([eE]xecutable\|[lL]ibrary\|[fF]lag\|[sS]ource-repository\|[tT]est-suite\)"
syn match cabalEntry "^\s\{0,4}[A-Za-z][a-zA-Z\-]*:" contains=cabalIdentifier,cabalColon

syn region cabalDescription start="^\s\{0,4}[dD]escription:" end="^\s\{0,4}[A-Za-z][a-zA-Z\-]*:" contains=cabalEntry,cabalLineComment,cabalBulletPoint keepend

highlight def link cabalIdentifier Identifier
highlight def link cabalLineComment Comment
highlight def link cabalOperator Operator
highlight def link cabalColon Operator
highlight def link cabalNumber Number
highlight def link cabalSection Structure
highlight def link cabalDelimiter Delimiter
highlight def link cabalBool Boolean
highlight def link cabalCompilerFlag Macro
highlight def link cabalConditional Conditional
highlight def link cabalBulletPoint Structure

let b:current_syntax = "cabal"
